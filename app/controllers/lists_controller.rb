class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
  @list = List.new(list_params)
  if @list.save
    redirect_to lists_url
  else
    render  :action => :new
  end
end

  def show
    @list = List.find(params[:id])
  end

  def  edit
    @list = List.find(params[:id])

  end

  def update
  @list = List.find(params[:id])
  if @list.update_attributes(list_params)
    redirect_to list_path(@list)
  else
    render  :action => :edit
  end
end

  def destroy
    @list = List.find(params[:id])
    if @list.can_destroy?

    @list.destroy
    flash[:alert] = '成功刪除'
    redirect_to lists_url, notice: 'The Due Date is over'

    else
    flash[:alert] = '已經過期無法刪除'
    redirect_to lists_url
    end

  end

  private

  def list_params
    params.require(:list).permit(:title, :due_date, :description)
  end
end
