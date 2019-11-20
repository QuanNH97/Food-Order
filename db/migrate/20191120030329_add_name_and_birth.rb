class AddNameAndBirth < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :birth, :date
    add_index :users, :name, unique: true
  end
end
