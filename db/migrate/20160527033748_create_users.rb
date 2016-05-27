class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.sting :last_name
      t.string :email
      t.string :password_digest
      t.string :photo

      t.timestamps null: false
    end
  end
end
