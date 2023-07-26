class Dog < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_breed,
                  against: :breed,
                  using: {
                     tsearch: { prefix: true }
                  }

  pg_search_scope :search_by_characteristics,
                  against: {
                    temperament: 'A',
                    breed_group: 'B',
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

end
