class Park < ApplicationRecord
    has_many :trees, foreign_key: 'park', primary_key: 'park_name'
    validates :park_id, :park_name, :location, presence: true
end
