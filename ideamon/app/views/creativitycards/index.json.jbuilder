json.array!(@creativitycards) do |creativitycard|
  json.extract! creativitycard, :id, :suggestion, :idea_id, :project_id, :user_id
  json.url creativitycard_url(creativitycard, format: :json)
end
