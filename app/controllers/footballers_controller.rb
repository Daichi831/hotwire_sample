class FootballersController < ApplicationController
  before_action :set_footballer, only: %i[ show edit update destroy ]

  def index
    @search = Footballer.ransack(params[:q])
    @search.sorts = 'id desc' if @search.sorts.empty?
    @footballers = @search.result.page(params[:page])
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
      flash.now.notice = "サッカー選手を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @footballer.update(footballer_params)
      flash.now.notice = "サッカー選手を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @footballer.destroy
    flash.now.notice = "サッカー選手を削除しました。"
  end

  private
    def set_footballer
      @footballer = Footballer.find(params[:id])
    end

    def footballer_params
      params.require(:footballer).permit(:name, :age)
    end
end
