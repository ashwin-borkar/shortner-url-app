class DropShortlinks < ActiveRecord::Migration[6.1]
  def change
  	drop_table :shortlinks
  end
end
