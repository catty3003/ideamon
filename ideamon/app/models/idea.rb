class Idea < ActiveRecord::Base
	belongs_to :project
	belongs_to :user

	validates_length_of :post, :maximum => 300
	validates :post, :project_id, :user_id, presence: true

	def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |ideas|
        csv << ideas.attributes.values_at(*column_names)
      end
    end
  end
  
end
