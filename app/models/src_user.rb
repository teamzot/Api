# == Schema Information
#
# Table name: src_users
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  source_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SrcUser < ApplicationRecord
    has_many :offers, as: :offerable
end
