class ListItem < ActiveRecord::Base
  belongs_to :list

  attr_accessible :description, :name

  validates :name, :presence => true
  validates :description, :presence => true
end
