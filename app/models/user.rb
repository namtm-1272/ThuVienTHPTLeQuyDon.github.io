class User < ApplicationRecord
  enum role: {admin: 0, teacher: 1, student: 2}

  belongs_to :class_user

  before_save :downcase_Tk

  validates :name, presence: true, length: { maximum: 40 }
  validates :Tk, presence: true, length: {minium: 10, maximum: 100}, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password

  scope :asc_name, ->{order name: :asc}
  scope :student_with, ->id {where("class_user_id = ?", id)}

  delegate :name, to: :class_user, prefix: :class_user, allow_nil: true

  has_secure_password

  def downcase_Tk
    self.Tk.downcase!
  end
end
