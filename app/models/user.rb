class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: [:google_oauth2]

  	has_many :user_tickets	
	has_many :tickets, :through => :user_tickets

	validates :email, presence: true, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}, uniqueness: true

	validates :phone, length: {minimum: 9, maximum: 12}, allow_blank: true
  	validates :password, format: {with: /\A[a-zA-Z0-9\.]{8,20}\z/ , message: "must be between 8 to 20 alphanumeric characters"}


        def self.from_omniauth(access_token)
          data = access_token.info

          where(email: data['email']).first_or_create do |user|
            user.provider = data['provider']
            user.uid = data['uid']
            user.name = data['name']
            user.email = data['email']
            user.password = Devise.friendly_token[0,20]
          end
        end

        def admin?()
          if self.role == "admin"
            return true
          else
            return false
          end
        end

end
