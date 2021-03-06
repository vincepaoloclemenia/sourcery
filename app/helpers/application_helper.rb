module ApplicationHelper
    def which_link?(controller_name)
        controller.controller_name == controller_name ? 'active-link' : ''
    end

    def avatar_for(user, options = { size: 40 })
        size = options[:size]
        style = options[:style]
        if user.avatar?
            if size <= 40
                image_tag user.avatar.url(:thumb), width: size, height: size, alt: user.username, class: 'avatar-image', style: style
            else
                image_tag user.avatar.url, width: size, height: size, alt: user.username, class: 'avatar-image', style: style
            end
        else
            image_tag user.avatar.url, width: size, height: size, alt: 'avatar image', class: 'avatar-image', style: style
        end
    end

    def current_link? con, action
        controller.controller_name == con && controller.action_name == action ? 'current-link' : ''
    end
end
