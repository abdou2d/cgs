class Episodes::LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_episode

    def create
        @episode.likes.where(user_id: current_user.id).first_or_create

        respond_to do |format|
            format.html {redirect_to @episode}
            format.js
        end
    end

    def destroy
        @episode.likes.where(user_id: current_user.id).destroy_all

        respond_to do |format|
            format.html {redirect_to @episode}
            format.js
        end     
    end

    private

    def set_episode
        @episode = Episode.friendly.find(params[:episode_id])
    end
end