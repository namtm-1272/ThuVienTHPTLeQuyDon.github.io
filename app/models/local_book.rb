class LocalBook < ApplicationRecord
  belongs_to :subject
  belongs_to :category
  
  scope :asc_name, ->{order name: :asc}

  delegate :name, to: :subject, prefix: :subject, allow_nil: true
  delegate :name, to: :category, prefix: :category, allow_nil: true
end
