class Category < ApplicationRecord
  has_many :book, dependent: :nullify
  scope :asc_name, ->{order name: :asc}
end
