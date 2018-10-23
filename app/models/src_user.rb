class SrcUser < ApplicationRecord
    has_many :offers, as: :offerable
end
