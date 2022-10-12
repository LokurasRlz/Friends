# rubocop:todo Layout/EndOfLine
json.extract! friend, :id, :first_name, :last_name, :email, :phone, :twitter, :created_at, :updated_at
json.url friend_url(friend, format: :json)
# rubocop:enable Layout/EndOfLine
