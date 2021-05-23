class CreateShortlinks < ActiveRecord::Migration[6.1]
  def change
    create_table :shortlinks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :url
      t.string :original

      t.timestamps
    end
  end
end
