class Episode < ApplicationRecord
    has_rich_text :body
    has_one_attached :img
    has_many :likes, dependent: :destroy
    has_many :taggings
    has_many :comments, dependent: :destroy
    has_many :tags, through: :taggings

    validates :title, :slug, :img, presence: true

    extend FriendlyId
    friendly_id :slug, use: :slugged


    scope :draft, ->{ where(published_at: nil)}
    scope :published, ->{ where.not(published_at: nil).where("published_at <= ?", Time.zone.now) }
    scope :scheduled, ->{ where.not(published_at: nil).where("published_at > ?", Time.zone.now) }

    def self.tagged_with(name)
        Tag.find_by_name!(name).episodes
    end
    
    def tag_list
        tags.map(&:name)
    end
    
    def tag_list=(names)
        self.tags = names.split(',').map do |n|
            Tag.where(name: n.strip).first_or_create!
        end
    end
end
