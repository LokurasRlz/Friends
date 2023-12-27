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
	id_tool: '103',
	precinto: '1696547',
	date_of_use: '18/10/2023',
	date_due_to: '15/4/2024',
	days_left: 111,
	state: 'OK',
	clase: 'Reduccion',
	pin: '3 1/2 Reg',
	box: 'NC 26',
	link_to_pdf: 'https://drive.google.com/file/d/1FbIEWR7Ml_G8hDTu5mNzRrRW5UVs00bF/view?usp=sharing',
	user: admin
  )