class CardController < ApplicationController
  before_action :set_card, only: %i(show edit update destroy)
  def new
    @card = Card.new
    @list = List.find_by(id: params[:list_id])
  end
  def create
    @card = Card.new(card_params)
    if @card.save
      flash[:notice] = 'カードを作成しました'
      redirect_to :root
    else
      render action: :new
    end
  end
  def show
  end

  def edit
    @lists = List.where(user_id: current_user.id)
  end
  def update
    if @card.update_attributes(card_params)
      flash[:notice] = 'カードを更新しました'
      redirect_to :root
    else
      render action :edit
    end
  end
  def destroy
    @card.destroy
    flash[:notice] = 'カードを削除しました'
    redirect_to :root
  end
  private
  def card_params
    params.require(:card).permit(:title,:memo,:list_id)
  end
  def set_card
    @card = Card.find_by(id: params[:id])
  end
  
  
end
