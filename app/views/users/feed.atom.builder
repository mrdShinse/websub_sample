atom_feed do |feed|
  feed.title("posts by #{@posts.first.user.email}")
  feed.updated(@posts.first.created_at)

  @posts.each do |post|
    feed.entry( post, url: "http://example.com/posts/#{post.id}" ) do |entry|
      entry.content(post.content, type: 'html')

      entry.author do |author|
        author.email(post.user.email)
      end
    end
  end
end
