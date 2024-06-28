class Tree < ApplicationRecord
    belongs_to :park, foreign_key: 'park', primary_key: 'park_name', optional: true
    validates :tree_id, :botanical, :common, presence: true

    paginates_per 10
end
