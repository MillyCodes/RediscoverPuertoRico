class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :name
      t.string :email
      t.string :b_day
    end
  end
end
