class User < ActiveRecord::Base
    belongs_to :property
    has_one :advert, :dependent => :destroy

    has_secure_password

    validates_uniqueness_of :email

    validates_confirmation_of :password_digest

    def complete_name
        "#{first_name} #{last_name}"
    end
end
