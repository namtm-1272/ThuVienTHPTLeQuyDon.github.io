class CreateLocalBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :local_books do |t|
      t.string :code
      t.string :name
      t.string :poision
      t.references :subject, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
