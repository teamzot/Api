class AddBaseSalaryToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :base_salary, :integer
  end
end
