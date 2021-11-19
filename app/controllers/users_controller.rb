class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Maks',
        username: 'Raziel',
        avatar_url: 'https://www.gravatar.com/avatar/7cb46e42cebe800660d429e8fa265154?s=100'
      ),
      User.new(
        id: 2,
        name: 'Irina',
        username: 'basinka'
      )
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Maksim',
      username: 'Aspidius',
      avatar_url: 'https://www.gravatar.com/avatar/7cb46e42cebe800660d429e8fa265154?s=100'
    )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('19.11.2021')),
      Question.new(text: 'В чем смысл жизни?', answer: 'Фиг его', created_at: Date.parse('19.11.2021')),
      Question.new(text: 'Еще вопрос', created_at: Date.parse('19.11.2021')),
      Question.new(text: 'И еще вопрос', created_at: Date.parse('19.11.2021'))
    ]

    @new_question = Question.new
    @questions_count = @questions.count
    @answers_count = @questions.count(&:answer)
    @unanswered_count = @questions_count - @answers_count
  end
end
