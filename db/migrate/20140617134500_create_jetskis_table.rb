class CreateJetskisTable < ActiveRecord::Migration
  def up
    create_table "jetski_translations", :force => true do |t|
      t.integer  "jetski_id"
      t.string   "locale"
      t.string   "title"
      t.text     "body"
      t.string   "meta_description"
      t.string   "slug"
      t.string   "meta_title"
      t.datetime "created_at",       :null => false
      t.datetime "updated_at",       :null => false
    end

    add_index "jetski_translations", ["locale"], :name => "index_jetski_translations_on_locale"
    add_index "jetski_translations", ["jetski_id"], :name => "index_jetski_translations_on_jetski_id"

    create_table "jetskis", :force => true do |t|
      t.integer  "section_id",       :null => false
      t.integer  "site_id",          :null => false
      t.integer  "brand_id"
      t.text     "body"
      t.string   "title"
      t.string   "meta_title"
      t.string   "meta_description"
      t.string   "slug"
      t.string   "name"
      t.string   "engine_type"
      t.integer  "cylinder"
      t.integer  "circulation_year"
      t.integer  "mileage"
      t.integer  "price"
      t.boolean  "in_stock"
      t.boolean  "first_hand"
      t.datetime "created_at",       :null => false
      t.datetime "updated_at",       :null => false
    end

    add_index "jetskis", ["section_id"], :name => "index_jetskis_on_section"
    add_index "jetskis", ["site_id"], :name => "index_jetskis_on_brand"
    add_index "jetskis", ["site_id"], :name => "index_jetskis_on_site"
    
    rename_column :colors, :motorcycle_id, :engine_id
    add_column :colors, :engine_type, :string
    
    add_index :colors, [:engine_id, :engine_type]
  end
end