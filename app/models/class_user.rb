class ClassUser < ApplicationRecord
  has_many :users, dependent: :nullify
  scope :asc_name, ->{order name: :asc}
end
