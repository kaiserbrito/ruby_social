class Mention < ApplicationRecord

  private
    def friends_name
      names_array = []
      user.following_users.each { |friend| names_array << friend.name}
      names_array
    end

    def html_type
      if is_a?(Post)
        content_html
      elsif is_a?(Comment)
        comment.html
      end
    end

    def mentioned_friends
      friends_name.select { |name| html_type.include? name}
    end

    def add_mention_links_to_content
      mentioned_friends.each { |friend_name|
        new_content = html_type.gsub!(friend_name, "<a href='/users/#{User.where(name: friend_name).first.slug}'>#{friend_name}</a>")
        self.content = new_content if is_a?(Post)
        self.comment = new_content if is_a?(Comment)}
    end
end
