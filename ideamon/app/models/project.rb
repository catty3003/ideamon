class Project < ActiveRecord::Base


	belongs_to :user
	has_many :ideas
	has_many :creativitycards

	validates :name, :deadline, :question, presence: true
	validates :name, uniqueness: true

	accepts_nested_attributes_for :creativitycards, 
  		allow_destroy: true, 
      :reject_if => :all_blank

	def is_delayed?
	 self.deadline < Date.today
	end

	def distance_from_now_in_days
	  (self.deadline - Date.today).to_i     
	end

	def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |projects|
        csv << projects.attributes.values_at(*column_names)
      end
    end
  end
	
end
