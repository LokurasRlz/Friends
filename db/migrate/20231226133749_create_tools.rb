class CreateTools < ActiveRecord::Migration[7.0]
  def up
    create_table :tools do |t|
      t.string :id_tool
      t.string :precinto
      t.date :date_of_use
      t.date :date_due_to
      t.string :days_left
      t.string :clase
      t.string :pin
      t.string :box
      t.string :link_to_pdf
      t.references :user, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :tools
  end
end
