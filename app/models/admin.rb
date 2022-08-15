class Admin < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save :downcase_email

  validates :name, presence: true, length: {maximum: 40}
  validates :email, format: {with: VALID_EMAIL_REGEX}
  validates :Tk, presence: true, length: {minimum: 5}, if: :Tk
  validates :password, presence: true, length: {minimum: 6}, if: :password
  has_secure_password

  private

  def downcase_email
    self.Tk.downcase!
  end
end
