# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Seed Admin Account
# Find or create the Admin Account
admin = User.find_or_create_by(email: 'admin@speservicios.com') do |user|
	user.password = '200692'
	user.password_confirmation = '200692'
	user.admin = true
  end


  Tool.create!(
	id_tool: 'T001',
	precinto: 'P001',
	date_of_use: nil,
	date_due_to: nil,
	link_to_pdf: 'https://example.com/pdf1',
	clase: 'Sample Text',
	rosca: 123,
	user: admin
  )