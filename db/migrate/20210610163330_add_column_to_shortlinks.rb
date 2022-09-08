class AddColumnToShortlinks < ActiveRecord::Migration[6.1]
  def change
  	add_column :shortlinks, :clicks, :integer, default: 0
  end
end
