class CreateDemands < ActiveRecord::Migration

  def change
    create_table :demands do |t|
      t.integer :user_id

      t.string :badge
      t.string :email
      t.string :name
      t.string :contacts
      t.string :service_type
      t.string :badge_b
      t.string :email_b
      t.string :name_b
      t.string :start_date
      t.string :end_date
      t.string :ip
      t.string :project_name
      t.string :customer_name
      t.string :purpose
      t.string :message
      t.boolean :processed

      t.timestamps
    end
  end
end
