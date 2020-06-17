class AssessmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_assessment, only: %i[:show, :edit, :update, :destroy]

  def create
    @assessment = Assessment.new(assessment_params)
    if @assessment.save
      redirect_to @assessment
    else
      render :new
    end
  end

  def new
    @assessment = Assessment.new
  end

  def index
    @assessment = Assessment.all
  end

  def show
    if @assessment.blank?
      redirect_to assessment_path
    else
      @questions = @assessment.questions
    end
  end

  def edit
    @assessment.find(params[:id])
  end


  def destroy
    @assessment = Assessment.find(params[:id])
    @assessment.destroy
    respond_to do |format|
      format.html { redirect_to assessments_url, notice: 'Assessment was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private

  def set_assessment
    @assessment = Assessment.find_by(id: params[:id])
  end

  def assessment_params
    params.require(:assessment).permit(:title, :_destroy, questions_attributes: [:id, :text, variants_attributes: [:id, :text, :value, :_destroy] ])
  end

end