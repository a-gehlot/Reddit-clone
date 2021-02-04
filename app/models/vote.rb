class Vote < ApplicationRecord
    belongs_to :votable, polymorphic: true

    def sum_votes(table_type, id)
        Vote.where(votable_type: table_type, votable_id: id).sum(:value)
    end
end
