class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.integer :demand_id

      t.string :title
      t.string :detail

      t.timestamps
    end
  end
end
