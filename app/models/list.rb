class List < ActiveRecord::Base
  attr_accessible :name, :when
  has_many :list_items, :dependent => :delete_all

  validates :name, :presence => true
end
