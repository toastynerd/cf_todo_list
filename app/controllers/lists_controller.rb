class ListsController < ApplicationController
  before_filter :find_list, :only => [:edit, :update, :show, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      flash[:notice]="Created a new list."
      redirect_to @list
    else
      flash[:alert]="Could not create list."
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
    if@list.update_attributes(params[:list])
      flash[:notice]="List has been updated."
      redirect_to @list
    else
      flash[:alert]="Could not update list."
      render :action => "edit"
    end
  end

  def destroy
    @list.destroy
    flash[:notice]="List has been deleted."
    redirect_to lists_path
  end

private
  def find_list
    @list = List.find(params[:id])
  end

end
