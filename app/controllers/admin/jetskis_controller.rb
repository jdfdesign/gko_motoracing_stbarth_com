class Admin::JetskisController < Admin::ResourcesController
  respond_to :html
  nested_belongs_to :site, :jetski_list
  has_scope :with_query, :only => :index

end
