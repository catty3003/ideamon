class AddShortdescriptionToCreativitycards < ActiveRecord::Migration
  def change
    add_column :creativitycards, :shortdescription, :string
  end
end
