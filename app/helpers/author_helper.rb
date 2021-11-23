module AuthorHelper
  def author_info(author)
    if author.blank?
      'Анонимус'
    elsif author == current_user
      author.username
    else
      link_to author.username, user_path(author)
    end
  end
end
