class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :long
      t.string :lat

      t.timestamps null: false
    end
  end
end
