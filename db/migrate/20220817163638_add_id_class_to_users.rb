class AddIdClassToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :in_lop, :integer
  end
end
