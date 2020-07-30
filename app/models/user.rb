class User < ApplicationRecord
    has_secure_password
    has_many :ratings
    has_many :drinks, dependent: :destroy 
    validates :username, presence: true
    validates :name, presence: true
    validates :password, presence: true
    validates :username, uniqueness: :true
end
