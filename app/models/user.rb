class User < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  #add enums:
  enum :status, [:user, :admin]
end
