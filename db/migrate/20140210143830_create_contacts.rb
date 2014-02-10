class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.text :first_name
      t.text :last_name
      t.text :phone
      t.date :birthday

      t.timestamps
    end
  end
end
