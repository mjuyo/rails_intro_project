class Park < ApplicationRecord
    has_many :trees, foreign_key: 'park', primary_key: 'park_name'
    has_many :assets, foreign_key: 'park_id', primary_key: 'park_id'
    validates :park_id, :park_name, :location, presence: true

 
end
