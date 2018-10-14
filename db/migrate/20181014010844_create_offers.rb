class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :post_title
      t.string :post_user
      t.boolean :satisfaction
      
      t.integer :annual_refresh
      t.integer :area
      t.integer :degree
      t.string :equity_schedule
      t.integer :experience
      t.integer :experience_level
      t.boolean :greencard
      
      t.integer :job_function
      t.integer :job_type
      t.integer :level

      t.string :other_offer
      t.integer :position_type
      t.datetime :post_time

      t.string :promotion_package
      t.integer :relocation_fee
      t.integer :season
      t.integer :source

      t.datetime :spider_time
      t.text :url
      
      t.timestamps

      # relation
      t.integer :company_id
    end
  end
end
