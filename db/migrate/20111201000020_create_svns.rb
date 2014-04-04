class CreateSvns < ActiveRecord::Migration

  def change
    create_table :svns do |t|
      t.integer :demand_id

      t.string  :repo_name
      t.string  :user0_name
      t.string  :user0_pass
      t.string  :added_users

      t.timestamps
    end
  end
end
