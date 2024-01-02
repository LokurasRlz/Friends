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
	attribute :clase, :string
	attribute :pin, :string
	attribute :box, :string
	attribute :link_to_pdf, :string
  
	before_save :set_date_due_to
  
	private
  
	def set_date_due_to
	  self.date_due_to = (Date.parse(date_of_use) + 6.months).strftime("%Y-%m-%d") if date_of_use.present?
	end
  end