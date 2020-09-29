class ListController < ApplicationController
  before_action :set_list,only: [:edit,:update,:destroy]

  def new
    @list = List.new
  end
  
  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = 'リストを作成しました'
      redirect_to :root
    else
      flash.now[:alert] = 'リスト作成失敗！'
      render action: :new
      end
    end

    def edit 
    end
    def update
      if @list.update_attributes(list_params)
        flash[:notice] = 'リストを更新しました'
        redirect_to :root
      else
        render action: :edit
      end
    end
    def destroy
      @list.destroy
      flash[:notice] = 'リストを削除しました'
      redirect_to :root
    end
    
    private
    def list_params
      params.require(:list).permit(:title).merge(user: current_user)
    end
    def set_list
      @list = List.find(params[:id])
    end
  
end
