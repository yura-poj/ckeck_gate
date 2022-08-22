# frozen_string_literal: true

class User < ApplicationRecord
  has_many :authorizations, dependent: :destroy
  has_many :gates, dependent: :destroy

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: %i[google_oauth2 github]

  def admin?
    admin
  end
end
