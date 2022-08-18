class User < ApplicationRecord
  before_save :downcase_Tk
  validates :name, presence: true, length: { maximum: 40 }
  validates :Tk, presence: true, length: {minium: 10, maximum: 100}
  validates :password, presence: true, length: { minimum: 6 }, if: :password
  
  has_secure_password

  def downcase_Tk
    self.Tk.downcase!
  end
end
