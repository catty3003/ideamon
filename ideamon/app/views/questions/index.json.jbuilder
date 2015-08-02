json.array!(@questions) do |question|
  json.extract! question, :id, :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :f14, :f15, :f16, :f17, :f18
  json.url question_url(question, format: :json)
end
