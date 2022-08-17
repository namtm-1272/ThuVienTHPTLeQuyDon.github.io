class User < ApplicationRecord
  before_save :downcase_email

  validates :name, presence: true, length: { maximum: 30 }
  validates :Tk, presence: true , length: {minium: 10, maximum: 60}
  validates :password, presence: true, length: { minimum: 6 }, if: :password

  has_secure_password

  private

  def downcase_email
    self.Tk.downcase!
  end
end
