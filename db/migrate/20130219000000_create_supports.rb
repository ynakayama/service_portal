class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|
      t.string :course
      t.string :text
      t.string :service_type

      t.timestamps
    end
  end
end
