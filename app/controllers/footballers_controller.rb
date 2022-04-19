class FootballersController < ApplicationController
  before_action :set_footballer, only: %i[ show edit update destroy ]

  def index
    @footballers = Footballer.page(params[:page])
  end

  def show
  end

  def new
    @footballer = Footballer.new
  end

  def edit
  end

  def create
    @footballer = Footballer.new(footballer_params)

    if @footballer.save
      redirect_to @footballer, notice: "Footballer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @footballer.update(footballer_params)
      redirect_to @footballer, notice: "Footballer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @footballer.destroy
    redirect_to footballers_url, notice: "Footballer was successfully destroyed."
  end

  private
    def set_footballer
      @footballer = Footballer.find(params[:id])
    end

    def footballer_params
      params.require(:footballer).permit(:name, :age)
    end
end
