# == Schema Information
#
# Table name: offers
#
#  id                    :bigint(8)        not null, primary key
#  post_title            :string(255)
#  satisfaction          :string(255)
#  annual_refresh        :integer
#  area                  :string(255)
#  degree                :string(255)
#  equity                :string(255)
#  equity_schedule       :string(255)
#  experience            :string(255)
#  experience_level      :string(255)
#  greencard             :string(255)
#  group                 :string(255)
#  job_function          :string(255)
#  job_type              :string(255)
#  level                 :integer
#  title                 :string(255)
#  interest_point        :string(255)
#  other_offer           :string(255)
#  position_type         :string(255)
#  post_time             :datetime
#  promotion_package     :string(255)
#  season                :string(255)
#  spider_time           :datetime
#  url                   :text(65535)
#  year                  :integer
#  base_salary           :integer
#  relocation_fee        :integer
#  relocation_fee_string :string(255)
#  sign_bonus            :integer
#  sign_bonus_string     :string(255)
#  yearly_bonus          :string(255)
#  apply_source          :string(255)
#  offerable_type        :string(255)
#  offerable_id          :integer
#  source_id             :integer
#  company_id            :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Offer < ApplicationRecord
    scope :by_annual_refresh, -> annual_refresh { where(annual_refresh: annual_refresh) }
    scope :by_area, -> area { where(area: area) }
    scope :by_degree, -> degree { where(degree: degree) }
    scope :by_equity, -> equity { where(equity: equity) }
    scope :by_equity_schedule, -> equity_schedule { where(equity_schedule: equity_schedule) }    
    scope :by_experience, -> experience { where(experience: experience) }
    scope :by_experience_level, -> experience_level { where(experience_level: experience_level) }
    scope :by_greencard, -> greencard { where(greencard: greencard) }
    scope :by_group, -> group { where(group: group) }
    scope :by_job_function, -> job_function { where(job_function: job_function) }
    scope :by_job_type, -> job_type { where(job_type: job_type) }
    scope :by_level, -> level { where(level: level) }
    scope :by_title, -> title { where(title: title) }
    scope :by_interest_point, -> interest_point { where(interest_point: interest_point) }
    scope :by_position_type, -> position_type { where(position_type: position_type) }
    scope :by_post_time, -> post_time { where(post_time: post_time) }
    scope :by_promotion_package, -> promotion_package { where(promotion_package: promotion_package) }
    scope :by_season, -> season { where(season: season) }
    scope :by_year, -> year { where(year: year) }
    scope :by_base_salary, -> base_salary { where(base_salary: base_salary) }
    scope :by_relocation_fee, -> relocation_fee { where(relocation_fee: relocation_fee) }
    scope :by_sign_bonus, -> sign_bonus { where(sign_bonus: sign_bonus) }
    scope :by_year_bonus, -> year_bonus { where(year_bonus: year_bonus) }
    scope :by_apply_source, -> apply_source { where(apply_source: apply_source) }
    scope :by_company_id, -> company_id { where(company_id: company_id) }
    scope :by_company_name, -> company_name { joins(:company).where("companies.name = ?", company_name) } 

    belongs_to :company
    belongs_to :offerable, polymorphic: true
    belongs_to :source
end
