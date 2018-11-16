class TimelogsController < ApplicationController
    before_action :authenticate_user!

    def index
        authorize! :read, Timelog
        @employees = current_client.users.employees
    end

    def new
        @employee = User.new
        @employment = @employee.build_employment
        @option = params[:option]
        @choices = [["Regular", "Regular"], ["Contractual", "Contractual"]]
    end

    

end