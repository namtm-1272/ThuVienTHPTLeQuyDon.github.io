class Book < ApplicationRecord
  has_one_attached :doc_file
  has_many_attached :doc_file_pages
end
