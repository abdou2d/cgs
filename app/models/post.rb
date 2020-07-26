class Post < ApplicationRecord
    has_rich_text :body
    has_one_attached :img

    extend FriendlyId
    friendly_id :slug, use: :slugged
end
