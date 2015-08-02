json.array!(@projects) do |project|
  json.extract! project, :id, :name, :deadline, :done, :question, :user_id
  json.url project_url(project, format: :json)
end
