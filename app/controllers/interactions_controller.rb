class InteractionsController < ApplicationController
  before_action :set_interaction, only: [:show, :edit, :update]
  before_action :require_user
  before_action :require_student, only: [:new, :create, :edit, :update]
  before_action :require_admin, only: [:index]

  def index
    @interactions = Interaction.all
  end

  def show
  end

  def new
    @lesson = Lesson.find(session[:lesson_id])
    @interaction = @lesson.interactions.build
  end

  def create
    @lesson = Lesson.find(session[:lesson_id])
    @interaction = @lesson.interactions.build(interaction_params)
    @interaction.student_id = current_student.id

    if @interaction.save
      flash[:success] = "Your interaction with the lesson was saved successfully"
      redirect_to student_path(current_student)
      session[:lesson_id] = nil
    else
      render :new
    end
  end

  def edit
  end

  def update
    @interaction.student_id = current_student.id
    if @interaction.update(interaction_params)
      flash[:success] = "Interaction was updated successfully"
      redirect_to student_path(current_student)
    else
      render :edit
    end
  end

  private

  def set_interaction
    @interaction = Interaction.find(params[:id])
  end

  def interaction_params
    params.require(:interaction).permit(:topic, :interaction, :interaction_audio, :interaction_file)
  end
end
