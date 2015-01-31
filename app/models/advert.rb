class Advert < ActiveRecord::Base
    belongs_to :user
    belongs_to :property
    has_many :images, :dependent => :destroy

    def property_address
        property.address
    end
end
