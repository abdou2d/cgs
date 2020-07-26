class Profile < ApplicationRecord
    belongs_to :user
    has_one_attached :avatar
    before_create :set_slug

    validates :avatar, content_type: [:png, :jpg, :jpeg], 
                  size: { less_than: 0.5.megabytes , message: ' اقصى حجم للصورة 500 كيلو بت' }



    def full_name
        [first_name, last_name].join(' ')
    end

    extend FriendlyId
    friendly_id :slug, use: :slugged
    validates :first_name, :last_name, length: { in: 3..10 }

    # validates :first_name, :last_name, presence: true


    private
  
    def set_slug
      self.slug = user.username.downcase
    end
end
