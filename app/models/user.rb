class User < ActiveRecord::Base
    belongs_to :property
    has_one :advert, :dependent => :destroy

    has_secure_password

    validates_presence_of :first_name, :last_name, :email, :nationality
    validates :email,
                uniqueness: true,
                format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
    validates :last_name,
                length: { minimum: 2, maximum: 255}
    validates :first_name,
                length: { minimum: 2, maximum: 255}
    validates :nationality,
                length: { minimum: 2, maximum: 255}


    validates_confirmation_of :password_digest

    before_create :default_values

    def as_json(options={})
        super.as_json(options).merge({:complete_name => complete_name})
    end

    def complete_name
        "#{first_name} #{last_name}"
    end

    private

    def default_values
        self.admin = false
        true
    end

end
