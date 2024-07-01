class Asset < ApplicationRecord
    belongs_to :park, foreign_key: 'park_name', primary_key: 'park_name'
    validates :park_id, :asset_class, presence: true
end
