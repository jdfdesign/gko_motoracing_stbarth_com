class MotorcyclesController < ContentsController
  respond_to :html, :js
  belongs_to :motorcycle_list
  has_scope :with_engine_type, :only => :index 
  has_scope :with_brand, :only => :index
  has_scope :with_first_hand, :only => :index
  has_scope :with_cylinder, :only => :index
  has_scope :with_title, :only => :index
  has_scope :with_in_stock, :type => :boolean, :only => :index
  
  self.includes = [:colors, :brand]
  
  protected
  
  def load_resources
    end_of_association_chain.includes(self.includes).with_globalize
  end

  def find_resource
    if params[:permalink].present?
      permalink = params[:permalink].split('/')
      begin
        c = end_of_association_chain.by_permalink(*permalink).first
      rescue
        error_404
      end
    elsif params[:id].present?
      begin
        c = end_of_association_chain.find(params[:id])
      rescue
        error_404
      end
    end
    set_resource_ivar(c)
  end 
end
