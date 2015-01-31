class Property < ActiveRecord::Base
    has_one :advert, :dependent => :destroy
    has_many :users
end
