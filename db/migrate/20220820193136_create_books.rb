class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :content
      t.string :author
      t.string :grade
      t.string :describe
      t.datetime :publish_on
      t.integer :num_watch, :default => 0
      t.references :subject, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
