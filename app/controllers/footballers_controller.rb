class FootballersController < ApplicationController
  before_action :set_footballer, only: %i[ show edit update destroy ]

  # GET /footballers
  def index
    @footballers = Footballer.all
  end

  # GET /footballers/1
  def show
  end

  # GET /footballers/new
  def new
    @footballer = Footballer.new
  end

  # GET /footballers/1/edit
  def edit
  end

  # POST /footballers
  def create
    @footballer = Footballer.new(footballer_params)

    if @footballer.save
      redirect_to @footballer, notice: "Footballer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /footballers/1
  def update
    if @footballer.update(footballer_params)
      redirect_to @footballer, notice: "Footballer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /footballers/1
  def destroy
    @footballer.destroy
    redirect_to footballers_url, notice: "Footballer was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_footballer
      @footballer = Footballer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def footballer_params
      params.require(:footballer).permit(:name, :age)
    end
end
