class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :post_title
      t.string :post_user
      t.boolean :satisfaction
      
      t.integer :annual_refresh
      t.string :area
      t.string :degree
      t.string :equity_schedule
      t.string :experience
      t.string :experience_level
      t.boolean :greencard
      
      t.string :job_function
      t.string :job_type
      t.integer :level

      t.string :other_offer
      t.string :position_type
      t.datetime :post_time

      t.string :promotion_package
      t.integer :relocation_fee
      t.string :season
      t.integer :string

      t.datetime :spider_time
      t.text :url
      
      t.timestamps

      # relation
      t.integer :company_id
    end
  end
end
