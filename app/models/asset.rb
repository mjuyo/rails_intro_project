class Asset < ApplicationRecord
    belongs_to :park, foreign_key: 'park_id', primary_key: 'park_id'


end
