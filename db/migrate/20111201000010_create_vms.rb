class CreateVms < ActiveRecord::Migration

  def change
    create_table :vms do |t|
      t.integer :demand_id

      t.string :vm_type_1st
      t.string :size_of_vm_1st
      t.string :number_of_vm_1st
      t.string :vm_type_2nd
      t.string :size_of_vm_2nd
      t.string :number_of_vm_2nd
      t.string :vm_type_3rd
      t.string :size_of_vm_3rd
      t.string :number_of_vm_3rd

      t.timestamps
    end
  end
end
