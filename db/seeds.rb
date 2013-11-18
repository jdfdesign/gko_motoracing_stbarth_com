# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

I18n.locale = :fr
@site = Site.first

@site.brands.all.map(&:destroy) 

@catalog = @site.motorcycle_lists.find_or_create_by_name!(
    :name => "my catalog",
    :title => "my catalog",
    :parent_id => @site.sections.root.id,
    :accept_categories => false,
    :accept_stickers => false,
    :published_at => Time.zone.now)

@catalog.motorcycles.all.map(&:destroy)

["Aprilia","Bmw","Daelim", "Ducati", "Gilera", "Harley davidson","Honda","Kawasaki","Kymco","Ktm","Mbk","Moto guzzi","Peugeot", "Piaggio","Suzuki", "Sym", "Triumph","Yamaha"].each do |b|
  @site.brands.create(:name => b)
end 

Motorcycle::TYPES.each do |type|
  3.times do |i|
    # new engines
    @product = @catalog.motorcycles.create!(
      :first_hand => true,
      :title => "#{type} neuf #{i}",
      :brand_id => @site.brands.rand(@site.brands.count),
      :engine_type => type,
      :cylinder => Motorcycle::CYLINDERS.sample,
      :price => 2000..11000,
      :in_stock => true
    )
  end
  # occasion engines
  3.times do |i|
    @product = @catalog.motorcycles.create!(
      :first_hand => false,
      :title => "#{type} occasion #{i}",
      :brand_id => @site.brands.rand(@site.brands.count),
      :engine_type => type,
      :cylinder => Motorcycle::CYLINDERS.sample,
      :circulation_year => random_date,
      :mileage => 5000..20000,
      :price => 800..5000)
  end   
end