class AddStoreBadguestTable < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :store_name
      t.string :email
      t.string :tax_ID

      t.timestamps null: false
    end

    create_table :badguests do |t|
      t.string :phone
      t.text :desc

      t.integer :store_id

      t.timestamps null: false
    end
  end
end
