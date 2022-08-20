class Link < ApplicationRecord
  scope :asc_describe, ->{order describe: :asc}
end
