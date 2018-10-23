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

require 'test_helper'

class OfferTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
