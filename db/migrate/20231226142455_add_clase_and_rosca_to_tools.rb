class AddClaseAndRoscaToTools < ActiveRecord::Migration[7.0]
  def change
    add_column :tools, :clase, :text
    add_column :tools, :rosca, :integer
  end
end
