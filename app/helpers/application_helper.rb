module ApplicationHelper
    def logged_in?
        unless session[:user_id] 
            redirect_to new_regestrations_path
        end
    end
end
