# == Schema Information
#
# Table name: offers
#
#  id                :bigint(8)        not null, primary key
#  post_title        :string(255)
#  satisfaction      :boolean
#  annual_refresh    :integer
#  area              :string(255)
#  degree            :string(255)
#  equity_schedule   :string(255)
#  experience        :string(255)
#  experience_level  :string(255)
#  greencard         :boolean
#  job_function      :string(255)
#  job_type          :string(255)
#  level             :integer
#  other_offer       :string(255)
#  position_type     :string(255)
#  post_time         :datetime
#  promotion_package :string(255)
#  relocation_fee    :integer
#  season            :string(255)
#  string            :integer
#  spider_time       :datetime
#  url               :text(65535)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  company_id        :integer
#  year              :integer
#  base_salary       :integer
#  offerable_type    :string(255)
#  offerable_id      :integer
#  source_id         :integer
#

class Offer < ApplicationRecord
    enum area: [:bay_area, :greater_seattle_area, :greater_new_york_area, :southen_california, :others]
    enum degree: [:bs, :ms, :phd, :other_deg]
    # experience
    # < 3 months, 3-1yr, 1-3yr, 3-5yr, 5-10yr, 11-15yr, 15-yr
    enum experience_level: [:fresh_grad, :jump, :exp_others]
    enum position_type: [:ic, :manager, :other_pos]
    enum job_type: [:fulltime, :parttime, :intern, :other_jtype]
    enum season: [:spring, :summer, :autumn, :winter]
    enum source: [:headhunter, :refer, :resume, :return, :other_srcs]

    belongs_to :company
    belongs_to :offerable, polymorphic: true
end
