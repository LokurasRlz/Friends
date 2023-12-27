class AddDetailsToFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :tools, :id_tool, :string
    add_column :tools, :precinto, :string
    add_column :tools, :date_of_use, :date
    add_column :tools, :date_due_to, :date
    add_column :tools, :clase, :string
    add_column :tools, :pin, :string
    add_column :tools, :box, :string
    add_column :tools, :link_to_pdf, :string
  end
end
