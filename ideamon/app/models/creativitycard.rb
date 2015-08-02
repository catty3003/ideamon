class Creativitycard < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	belongs_to :project
	belongs_to :user
end
