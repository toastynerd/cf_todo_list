class ListItemsController < ApplicationController
  before_filter :find_list

  def new
    @list_item = @list.list_item.build
  end
private
  def find_list
    @list = List.find(params[:list_id])
  end
end
