class ApplicationController < ActionController::Base # rubocop:todo Layout/EndOfLine
	protect_from_forgery with: :exception
end
