class Subject < ApplicationRecord
  scope :asc_name, ->{order name: :asc}
end
