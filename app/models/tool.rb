# app/models/tool.rb

class Tool < ApplicationRecord
	belongs_to :user
  
	# Add the attributes
	attribute :id_tool, :string
	attribute :precinto, :string
	attribute :date_of_use, :string
	attribute :date_due_to, :string
	attribute :days_left, :integer
	attribute :state, :string
	attribute :tipo, :string
	attribute :pin, :string
	attribute :box, :string
	attribute :link_to_pdf, :string
  end
  