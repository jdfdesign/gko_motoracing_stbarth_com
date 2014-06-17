class Color < ActiveRecord::Base 
  belongs_to :engine, :polymorphic => true
  default_scope :order => 'name'
  attr_accessible :name, :hex, :motorcycle_id
end