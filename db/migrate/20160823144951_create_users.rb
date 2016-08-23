class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|

      t.timestamps
      t.string :first_name
      t.string :last_name
      t.string :auth_token
      t.string :email
      t.string :password_digest
      t.string :address
      t.float :latitude
      t.float :longitude
    end
    add_index :users, :auth_token
    add_index :users, :email
  end
end
