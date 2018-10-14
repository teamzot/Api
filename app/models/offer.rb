# == Schema Information
#
# Table name: offers
#
#  id                :bigint(8)        not null, primary key
#  post_title        :string(255)
#  post_user         :string(255)
#  satisfaction      :boolean
#  annual_refresh    :integer
#  area              :integer
#  degree            :integer
#  equity_schedule   :string(255)
#  experience        :integer
#  experience_level  :integer
#  greencard         :boolean
#  job_function      :integer
#  job_type          :integer
#  level             :integer
#  other_offer       :string(255)
#  position_type     :integer
#  post_time         :datetime
#  promotion_package :string(255)
#  relocation_fee    :integer
#  season            :integer
#  source            :integer
#  spider_time       :datetime
#  url               :text(65535)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  company_id        :integer
#

class Offer < ApplicationRecord
    belongs_to :company
end
