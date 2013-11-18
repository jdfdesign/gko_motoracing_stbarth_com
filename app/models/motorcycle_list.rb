class MotorcycleList < Section
  include Extensions::Models::IsList
  has_many :motorcycles, :foreign_key => 'section_id', :dependent => :destroy

  def content_type
    "Motorcycle"
  end
end