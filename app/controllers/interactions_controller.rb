class InteractionsController < ApplicationController

  def show
    @interaction = Interaction.find(params[:id])
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

  private

  def interaction_params
    params.require(:interaction).permit(:topic, :interaction, :interaction_audio, :interaction_file)
  end
end
