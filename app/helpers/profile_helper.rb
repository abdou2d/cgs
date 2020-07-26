module ProfileHelper

    def profile_avatar(profile)
        if profile.avatar.present?
            image_tag(profile.avatar.variant(combine_options: {resize: '100x100^', extent: '100x100'}), class: 'uk-border-circle')
        else
          render partial: 'shared/avatar'
        end
    end

end
