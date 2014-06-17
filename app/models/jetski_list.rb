class JetskiList < Section
  include Extensions::Models::IsList
  has_many :jetskis, :foreign_key => 'section_id', :dependent => :destroy

  def content_type
    "Jetski"
  end
end