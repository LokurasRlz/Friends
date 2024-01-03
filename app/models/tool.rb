# app/models/tool.rb

class Tool < ApplicationRecord
	belongs_to :user
  
	# Add the attributes
	attribute :id_tool, :string
	attribute :precinto, :string
	attribute :date_of_use, :date
	attribute :date_due_to, :date
	attribute :days_left, :integer
	attribute :state, :string
	attribute :clase, :string
	attribute :pin, :string
	attribute :box, :string
	attribute :link_to_pdf, :string
  
	before_save :set_date_due_to
  
	private
  
	def set_date_due_to
		self.date_due_to = (Date.parse(date_of_use.to_s) + 6.months) if date_of_use.present?
	  end
end