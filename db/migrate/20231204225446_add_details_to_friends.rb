class AddDetailsToFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :id_tool, :string
    add_column :friends, :precinto, :string
    add_column :friends, :date_of_use, :date
    add_column :friends, :date_due_to, :date
    add_column :friends, :link_to_pdf, :string
  end
end
