# == Schema Information
#
# Table name: companies
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ApplicationRecord
    has_many :offers
end
