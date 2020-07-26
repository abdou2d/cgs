class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :episodes, through: :taggings

    default_scope { order('LOWER(name) ASC') }

    validates :name, uniqueness: { case_sensitive: false }
end
