Site.class_eval do
  has_many :motorcycle_lists
  has_many :motorcycles, :through => :motorcycle_lists
  has_many :jetski_lists
  has_many :jetskis, :through => :jetski_lists
  has_many :brands, :dependent => :destroy

  def motorcycle_list
    motorcycle_lists.first
  end
  
  def jetski_list
    jetski_lists.first
  end
end