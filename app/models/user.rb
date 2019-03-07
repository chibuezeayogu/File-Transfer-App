# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /@/ }
  validates :password, presence: true, length: { in: 6..36 }
  validates :password_confirmation, presence: true

  before_validation :downcase_email

  def downcase_email
    self.email = email.downcase.strip if email.present?
  end
end
