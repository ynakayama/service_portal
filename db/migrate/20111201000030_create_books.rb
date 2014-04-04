class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :demand_id

      t.string :title
      t.string :contact_at_stock
      t.string :date_should_contact

      t.timestamps
    end
  end
end
