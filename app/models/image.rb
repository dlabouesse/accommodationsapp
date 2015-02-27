class Image < ActiveRecord::Base
    belongs_to :advert

    mount_uploader :name, ImageUploader
end
