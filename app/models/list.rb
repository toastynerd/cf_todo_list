class List < ActiveRecord::Base
  attr_accessible :name, :when
  has_many :list_items

  validates :name, :presence => true
end
