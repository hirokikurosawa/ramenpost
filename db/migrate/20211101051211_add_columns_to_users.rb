class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :icon, :string
    add_column :users, :introduction, :text
    add_column :users, :is_active, :boolean, default: true, null: false
  end
end