class PagesController < ApplicationController
    def index
        if current_user && current_user.admin?
            redirect_to "/admin"
        end
    end
    
    def user_signup
        @job_seeker = "jobseeker"
        @employer = "employer"
    end

    def inquire
        @inquiry = Inquiry.new
        @industries = [["Accounting", "Accounting"], ["Medical Stuff", "Medical Stuff"], ["BPO", "BPO"], ["Information Technology", "Information Technology"]]
        @sizes = [["1-50", "1-50"], ["51 - 200", "51 - 200"], ["201 - 500", "201 - 500"], ["501 - 1000", "501 - 1000"], [" > 1000 employees", " > 1000 employees"]]
    end

    def create_inquiry
        @inquiry = Inquiry.new(inquiry_params)
        if @inquiry.save
            redirect_to root_path, notice: "You Inquiry has been sent. Kindly give us a moment. Thank you for inquiring"
        else
            redirect_to inquire_path, alert: @inquiry.errors.full_messages.join(", ")
        end
    end


    private

        def inquiry_params
            params.require(:inquiry).permit(:contact_number, :company_name, :industry, :address, :company_function, :first_name, :last_name, :position, :company_size, :info_from )
        end

end