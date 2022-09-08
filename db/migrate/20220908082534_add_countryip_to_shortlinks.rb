class AddCountryipToShortlinks < ActiveRecord::Migration[6.1]
  def change
    add_column :shortlinks, :country, :string
    add_column :shortlinks, :ip_address, :string
  end
end
