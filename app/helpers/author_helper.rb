module AuthorHelper
  def author_info(question)
    if question.author.blank?
      "Анонимус #{question.ip}"
    elsif question.author == current_user
      question.author.username
    else
      link_to question.author.username, user_path(question.author)
    end
  end
end
