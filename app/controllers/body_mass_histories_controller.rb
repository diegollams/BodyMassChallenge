class BodyMassHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_body_mass_history, only: [:show, :edit, :update, :destroy]

  # GET /body_mass_histories
  # GET /body_mass_histories.json
  def index
    @body_mass_histories = BodyMassHistory.all.order(:created_at).page params[:page]
  end


  # POST /body_mass_histories
  # POST /body_mass_histories.json
  def create
    @body_mass_history = BodyMassHistory.new(body_mass_history_params)
    @body_mass_history.user  = current_user
    respond_to do |format|
      if @body_mass_history.save
        format.json { render :show, status: :created, location: @body_mass_history }
      else
        format.json { render json: @body_mass_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /body_mass_histories/1
  # DELETE /body_mass_histories/1.json
  def destroy
    @body_mass_history.destroy
    respond_to do |format|
      format.html { redirect_to body_mass_histories_url, notice: 'Body mass history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_body_mass_history
      @body_mass_history = BodyMassHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def body_mass_history_params
      params.require(:body_mass_history).permit(:height, :weight, :body_mass)
    end
end
