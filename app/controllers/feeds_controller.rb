# frozen_string_literal: true

class FeedsController < ApplicationController # :nodoc:
  skip_before_action :verify_authenticity_token

  DATA_DIR     = '/db/feeds/'
  VERIFY_TOKEN = 'hoge'

  def index
    req_method = request.request_method

    if req_method == 'GET'
      return head 404 unless script_get
      p_challenge = params['hub.challenge']
      render text: p_challenge.chomp, status: 200

    elsif req_method == 'POST'
      script_post request
      head :ok
    end
  end

  private

  def script_get
    p_mode         = params['hub.mode']
    p_verify_token = params['hub.verify_token']

    if %w[subscribe unsubscribe].include? p_mode
      if p_verify_token == VERIFY_TOKEN
        response.headers['Content-Type'] = 'text/plain'
        return true
      end
    end
    false
  end

  def script_post(request)
    req_body = request.body.read
    hub_sig = request.env['HTTP_X_HUB_SIGNATURE']
    sha1 = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::SHA1.new, VERIFY_TOKEN, req_body)

    return unless hub_sig == sha1
    file_name = "#{Time.now.strftime('%Y%m%d%H%M%S')}_atom.xml"
    File.open("#{DATA_DIR}#{file_name}", 'wb') { |f| f.write req_body }
  end
end
