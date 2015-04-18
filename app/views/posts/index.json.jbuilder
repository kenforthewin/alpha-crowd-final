json.array!(@posts) do |post|
  json.extract! post, :id, :topic_id, :text, :user_id
  json.url post_url(post, format: :json)
end
