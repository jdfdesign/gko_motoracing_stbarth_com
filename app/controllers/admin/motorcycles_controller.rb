class Admin::MotorcyclesController < Admin::ResourcesController
  respond_to :html
  nested_belongs_to :site, :motorcycle_list
  has_scope :with_query, :only => :index

end
