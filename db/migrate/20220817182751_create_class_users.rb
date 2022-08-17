class CreateClassUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :class_users do |t|
      t.string :name, null: false, index: {unique: true}
      t.string :grade
      t.timestamps
    end
  end
end
