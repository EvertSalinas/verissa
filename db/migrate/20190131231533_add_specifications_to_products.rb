class AddSpecificationsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :specifications, :string, array: true, default: []
  end
end
