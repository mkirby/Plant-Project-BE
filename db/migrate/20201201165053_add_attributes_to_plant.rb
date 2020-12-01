class AddAttributesToPlant < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :slug, :string
  end
end
