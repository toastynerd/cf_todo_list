class ListItemsController < ApplicationController
  before_filter :find_list
  before_filter :find_list_item, :only => [:show, :edit, :update, :destroy]

  def index
    @list_items = ListItem.all
  end

  def new
    @list_item = @list.list_items.build
  end

  def create
    @list_item = @list.list_items.build(params[:list_item])
    if @list_item.save
      flash[:notice]="Created a new list item."
      redirect_to @list
    else
      flash[:alert]="Could not create list item."
      render :action => "new"
    end
  end

  def show
    #
  end

  def edit
    #
  end

  def update
    if @list_item.update_attributes(params[:list_item])
      flash[:notice]="Updated list item."
      redirect_to @list 
    else
      flash[:alert]="Could not update list item."
      render :action => "edit"
    end
  end

  def destroy
    @list_item.destroy
    flash[:notice]="List item has been deleted."
    redirect_to [@list]
  end

private
  def find_list
    @list = List.find(params[:list_id])
  end

  def find_list_item
    @list_item = ListItem.find(params[:id])
  end

end
