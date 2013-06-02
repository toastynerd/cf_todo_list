class ListItem < ActiveRecord::Base
  belongs_to :list
  attr_accessible :description, :name
end
