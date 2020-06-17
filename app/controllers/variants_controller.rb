class VariantsController < ApplicationController

  before_action :set_variant, only: [:show, :edit, :update, :destroy]
  def create
    @variant = Variant.new(variant_params)
  end

  def new
    @variant = Variant.new
  end

  def index
    @variant = Variant.all
  end

  def show
    @variant.find(params[:id])
  end

  def edit
    @variant.find(params[:id])
  end


  def destroy
    @variant = Variant.find(params[:id])
    @variant.destroy
    respond_to do |format|
      format.html { redirect_to variants_url, notice: 'Variant was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private

  def set_assessment
    @variant = Variant.find_by(id: params[:id])
  end

  def variant_params
    params.require(:variant).permit(:id, :text, :value)
  end

end