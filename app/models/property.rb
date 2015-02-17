class Property < ActiveRecord::Base
    has_one :advert, :dependent => :destroy
    has_many :users

    validates_presence_of :address, :kind, :nb_of_rooms, :nb_of_bathrooms

    validates :nb_of_rooms, numericality: {only_integer: true, greater_than: 0}
    validates :nb_of_bathrooms, numericality: {only_integer: true, greater_than: 0}

    geocoded_by :address
    after_validation :geocode
end
