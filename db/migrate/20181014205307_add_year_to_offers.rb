class AddYearToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :year, :integer
  end
end
