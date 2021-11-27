class QuestionsController < ApplicationController
  before_action :load_question, only: %i[edit update destroy]
  before_action :authorize_user, except: [:create]

  def edit; end

  def create
    @question = Question.new(question_create_params)
    @question.author = current_user
    @question.ip = request.remote_ip

    if @question.save
      redirect_to user_path(@question.user), notice: 'Вопрос задан.'
    else
      render :edit
    end
  end

  def update
    if @question.update(question_update_params)
      redirect_to user_path(@question.user), notice: 'Вопрос сохранен.'
    else
      render :edit
    end
  end

  def destroy
    user = @question.user
    @question.destroy

    redirect_to user_path(user), notice: 'Вопрос удален = (.'
  end

  private

  def load_question
    @question = Question.find(params[:id])
  end

  def authorize_user
    reject_user unless @question.user == current_user
  end

  def question_create_params
    params.require(:question).permit(:user_id, :text)
  end

  def question_update_params
    params.require(:question).permit(:answer)
  end
end
