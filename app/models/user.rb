class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :requests
  has_many :collections, dependent: :destroy
  has_many :collected_outfits, through: :collections, source: :outfit

  include Flyable

  def admin?
  	self.role == "admin"
  end

  def collected_outfits?(outfit)
    self.collected_outfits.include?(outfit)
  end
end
