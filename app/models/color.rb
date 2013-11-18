class Color < ActiveRecord::Base 
  belongs_to :motorcycle
  default_scope :order => 'name'
  attr_accessible :name, :hex, :motorcycle_id
end