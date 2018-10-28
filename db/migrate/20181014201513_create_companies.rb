class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.timestamps

      t.index ["name"], name: "index_companies_on_name"
    end
  end
end
