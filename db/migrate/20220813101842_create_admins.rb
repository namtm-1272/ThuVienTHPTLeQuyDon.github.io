class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :name
      t.datetime :birthday
      t.string :email, index: {unique: true}
      t.string :Tk,  null: false, index: {unique: true}
      t.string :password_digest
      t.integer :is_gv
      
      t.timestamps
    end
  end
end
