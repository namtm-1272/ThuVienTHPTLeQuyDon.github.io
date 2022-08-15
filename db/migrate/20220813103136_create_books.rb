class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :content
      t.string :author
      t.string :subject
      t.string :image
      t.string :describe
      t.datetime :publish_on
      
      t.timestamps
    end
  end
end
