module CommentsHelper

    def edit_delete(c)
        if current_user.id == c.user_id
            link_to 'Delete', comment_path(c), method: :delete, data:{Confirm: "Delete?"}
            link_to 'Edit', edit_comment_path(c)
        end
    end
end
