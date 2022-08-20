class CreateAccesses < ActiveRecord::Migration[6.1]
  def change
    create_table :accesses do |t|
      t.integer :num_access
      t.timestamps
    end
  end
end
