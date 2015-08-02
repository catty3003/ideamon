json.array!(@ideas) do |idea|
  json.extract! idea, :id, :post, :project_id, :user_id
  json.url idea_url(idea, format: :json)
end
