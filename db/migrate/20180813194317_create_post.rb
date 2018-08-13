class CreatePost < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :username
      t.string :title
      t.string :content
      t.belongs_to :user, index: true 

    end
  end
end
