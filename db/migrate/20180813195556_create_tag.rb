class CreateTag < ActiveRecord::Migration[5.2]
  def change
    create_table :tagss do |t|
      t.integer :name
    end
  end
end
