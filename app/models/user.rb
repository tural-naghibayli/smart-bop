class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :rig
  has_many :pressure_tests, dependent: :destroy
  has_many :approvals
  has_one :bop, through: :rig
  validates :name, :position, :company, :rig, presence: true
end
