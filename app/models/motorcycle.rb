class Motorcycle < ActiveRecord::Base

  TYPES = ["Scooter","Moto", "Quad", "SSV"]
  CYLINDERS = [50,80,100,125,150,200,250,300,350,390,400,450,465,500,550,600,690,700]
  TRANSLATED_FIELD = [
    :title, :body, :meta_description, :meta_title, :slug
  ].freeze

  translates *TRANSLATED_FIELD

  class Translation
    attr_accessible :locale
  end
  
  attr_accessible (:body, 
    :title, 
    :name, 
    :brand, 
    :engine_type, 
    :cylinder, 
    :circulation_year, 
    :mileage, 
    :price, 
    :in_stock, 
    :first_hand, 
    :color, 
    :brand_id,
    :colors_attributes)

  include Extensions::Models::BelongsToSection
  include Extensions::Models::Sluggable
  include Extensions::Models::HasManyImageAssignments 

  belongs_to :brand
  has_many :colors, :dependent => :destroy
  
  accepts_nested_attributes_for :colors, :allow_destroy => true,
    :reject_if => proc { |a| a[:name].blank? || a[:hex].blank? }
    
  validates :title, :presence => true, :uniqueness => {:scope => :section_id, :case_sensitive => false}
  
  def self.with_title(q)
    joins(:translations).where("#{self.translation_class.table_name}.title LIKE ?", "%#{q}%")
  end
  
  def self.with_engine_type(q)
    where(:engine_type => q)
  end
  
  def self.with_brand(q)
    where(:brand_id => q)
  end
  
  def self.with_cylinder(q)
    where(:cylinder => q)
  end

  def self.with_first_hand(q)
    where(:first_hand => q)
  end
  
  def self.with_in_stock
    where(:in_stock => true)
  end
  
  # Indicate if this page should be included in robot.txt
  # use trackable? rather than checking the attribute directly. this
  # allows sub-classes to override trackable? if they want to provide
  # their own definition.
  def trackable?
    true
  end
end 
