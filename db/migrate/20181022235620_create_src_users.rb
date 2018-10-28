class CreateSrcUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :src_users do |t|
      t.string :name
      t.integer :source_id

      t.timestamps

      t.index ["name"]
    end
  end
end
