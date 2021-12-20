class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :todos

  scope :search_email, ->(str) {
    where("email LIKE ?", "%#{str}%")
  }

  def name
    email.split("@")[0]
  end
end
