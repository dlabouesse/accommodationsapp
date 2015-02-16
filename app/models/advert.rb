class Advert < ActiveRecord::Base
    belongs_to :user
    belongs_to :property
    has_many :images, :dependent => :destroy

    validates_presence_of :content, :rent, :nb_of_free_beds

    validates :nb_of_free_beds, numericality: {only_integer: true, greater_than: 0}
    validates :rent, numericality: {greater_than: 0}

    def property_address
        property.address
    end
end
