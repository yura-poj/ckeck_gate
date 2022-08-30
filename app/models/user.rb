# frozen_string_literal: true

class User < ApplicationRecord
  TYPES = %w[Kid Parent].freeze
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: %i[google_oauth2 github]

  has_many :authorizations, dependent: :destroy
  has_many :gates, dependent: :destroy
  has_many :users, through: :relations, dependent: :destroy

  validates :email, :type, :name, presence: true
end
