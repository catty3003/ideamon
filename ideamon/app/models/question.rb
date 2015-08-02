class Question < ActiveRecord::Base

	belongs_to :user
	validates :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :f14, :f15, :f16, :f17,  presence: true

	def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |questions|
        csv << questions.attributes.values_at(*column_names)
      end
    end
  end

end
