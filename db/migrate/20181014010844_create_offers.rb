class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string "post_title"
      t.string "satisfaction"
      t.integer "annual_refresh"
      t.string "area"
      t.string "degree"
      t.string "equity"
      t.string "equity_schedule"
      t.string "experience"
      t.string "experience_level"
      t.string "greencard"
      t.string "group"
      t.string "job_function"
      t.string "job_type"
      t.integer "level"
      t.string "title"

      t.string "interest_point"
      t.string "other_offer"
      t.string "position_type"
      t.datetime "post_time"
      t.string "promotion_package"
      t.string "season"

      t.datetime "spider_time"
      t.text "url"
      t.integer "year"

      # for salaries
      t.integer "base_salary"
      t.integer "relocation_fee"
      t.string "relocation_fee_string"
      t.integer "sign_bonus"
      t.string "sign_bonus_string"
      t.string "yearly_bonus"
      
      t.string "apply_source"

      # for relationship   
      t.string "offerable_type"
      t.integer "offerable_id"
      t.integer "source_id"
      t.integer "company_id"

      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false

      t.index ["post_title"], name: "index_offers_on_post_title"
      t.index ["area"], name: "index_offers_on_area"
      t.index ["degree"], name: "index_offers_on_degree"
      t.index ["job_function"], name: "index_offers_on_job_function"
      t.index ["position_type"], name: "index_offers_on_position_type"
      t.index ["season"], name: "index_offers_on_position_season"
      t.index ["year"], name: "index_offers_on_year"
      t.index ["base_salary"], name: "index_offers_on_base_salary"
      t.index ["sign_bonus"], name: "index_offers_on_sign_bonus"
      t.index ["relocation_fee"], name: "index_offers_on_relocation_fee"
      t.index ["yearly_bonus"], name: "index_offers_on_yearly_bonus"
      t.index ["apply_source"], name: "index_offers_on_apply_source"
    end
  end
end
