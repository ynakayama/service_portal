class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :vm_type

      t.timestamps
    end
  end
end
