class Comment < ApplicationRecord
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller.current_user }
  
  belongs_to :user
  belongs_to :episode
  has_one_attached :img
  has_rich_text :body
  validates :body, presence: true, allow_blank: false

  validates :img, content_type: [:png, :jpg, :jpeg], 
                  size: { less_than: 1.megabytes , message: 'اقصى حجم للصورة 1 ميجا' }


end
