class CreateMotorcycleTables < ActiveRecord::Migration
  def up
    create_table :motorcycles, :force => true  do |t|
      t.integer :section_id, :null => false
      t.integer :site_id, :null => false
      t.integer :brand_id
      t.text :body
      t.string :title
      t.string :meta_title
      t.string :meta_description
      t.string :slug
      t.string :name
    	t.string :engine_type
    	t.integer :cylinder
    	t.integer :circulation_year
    	t.integer :mileage
    	t.integer :price
    	t.boolean :in_stock
    	t.boolean :first_hand
      t.timestamps
    end
    add_index :motorcycles, :section_id, :name => "index_motorcycles_on_section"
    add_index :motorcycles, :site_id, :name => "index_motorcycles_on_site"
    add_index :motorcycles, :site_id, :name => "index_motorcycles_on_brand"
    
    Motorcycle.create_translation_table! :body => :text, :meta_title => :string, :meta_description => :string, :slug => :string, :title => :string 
    
    create_table :brands, :force => true  do |t|
      t.integer :site_id, :null => false
      t.string :name
      t.string :image_mime_type
      t.string :image_name
      t.integer :image_size
      t.integer :image_width
      t.integer :image_height
      t.string :image_uid
      t.string :image_ext
    end
    
    add_index :brands, :site_id, :name => "index_brands_on_site" 
    
    create_table :colors, :force => true  do |t|
      t.integer :motorcycle_id, :null => false
      t.string :hex
      t.string :name
    end
    
    add_index :colors, :motorcycle_id, :name => "index_colors_on_motorcycle"
  end
  
  def down
    
  end
end