class Brand < ActiveRecord::Base
  image_accessor :image 
  belongs_to :site, :touch => true
  has_many :motorcycles, :dependent => :nullify 
  default_scope :order => 'name'
  attr_accessible :name, :site_id, :image

end