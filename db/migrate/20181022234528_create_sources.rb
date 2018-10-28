class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :name
      t.timestamps

      t.index ["name"], name: "index_sources_on_name"
    end
  end
end
