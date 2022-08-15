class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :class_in
      t.datetime :birthday
      t.string :email, index: {unique: true}
      t.string :Tk, null: false, index: {unique: true}
      t.string :password_digest

      t.references :teacher, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
