class AddOfferableToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :offerable_type, :string
    add_column :offers, :offerable_id, :integer
    remove_column :offers, :post_user
    add_column :offers, :source_id, :integer
  end
end
