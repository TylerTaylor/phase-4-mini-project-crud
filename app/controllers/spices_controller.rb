class SpicesController < ApplicationController
  before_action :find_spice, only: [:show, :update, :destroy]

  def index
    spices = Spice.all
    render json: spices
  end

  def create
    spice = Spice.create!(spice_params)
    render json: spice, status: :created
  end

  def update
    @spice.update(spice_params)

    if @spice 
      render json: @spice
    else
      render json: { error_msg: "spice not found" }
    end
  end

  def destroy
    # spice = Spice.find_by(id: params[:id])
    id = @spice.id
    @spice.destroy

    # head :no_content

    render json: { msg: "successfully destroyed #{id}" }
  end

  private

  def find_spice
    @spice = Spice.find_by(id: params[:id])
  end

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

end
