json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :type, :date_of_birth, :breed, :user_id, :weight, :personality
  json.url pet_url(pet, format: :json)
end
