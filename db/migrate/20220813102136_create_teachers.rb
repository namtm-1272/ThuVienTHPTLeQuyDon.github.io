class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :to
      t.string :mon
      
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
