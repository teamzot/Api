# == Schema Information
#
# Table name: offers
#
#  id                :bigint(8)        not null, primary key
#  post_title        :string(255)
#  satisfaction      :string(255)
#  annual_refresh    :integer
#  area              :string(255)
#  degree            :string(255)
#  equity            :string(255)
#  equity_schedule   :string(255)
#  experience        :string(255)
#  experience_level  :string(255)
#  greencard         :string(255)
#  group             :string(255)
#  job_function      :string(255)
#  job_type          :string(255)
#  level             :integer
#  title             :string(255)
#  interest_point    :string(255)
#  other_offer       :string(255)
#  position_type     :string(255)
#  post_time         :datetime
#  promotion_package :string(255)
#  season            :string(255)
#  spider_time       :datetime
#  url               :text(65535)
#  year              :integer
#  base_salary       :integer
#  relocation_fee    :integer
#  sign_bonus        :integer
#  yearly_bonus      :string(255)
#  apply_source      :string(255)
#  offerable_type    :string(255)
#  offerable_id      :integer
#  source_id         :integer
#  company_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class OfferTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
