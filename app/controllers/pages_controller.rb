class PagesController < ApplicationController

    def index
    end
    
    def user_signup
        @job_seeker = "jobseeker"
        @employer = "employer"
    end

    def inquire
    end
end