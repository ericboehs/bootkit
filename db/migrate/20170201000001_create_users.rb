class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, unique: true
      t.string :password_digest, index: true
      t.string :perishable_token, index: true

      t.timestamps
    end
  end
end
