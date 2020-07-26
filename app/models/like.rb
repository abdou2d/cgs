class Like < ApplicationRecord
    include PublicActivity::Model
    tracked owner: ->(controller, model) { controller.current_user }

    belongs_to :user
    belongs_to :episode
end
