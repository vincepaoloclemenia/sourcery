class UsersController < ApplicationController

    def create_user
        respond_to do |format|
            if params[:user][:employment_attributes][:employment_date] == "" || params[:user][:employment_attributes][:employment_date].empty? || params[:user][:employment_attributes][:employment_date].blank?
                format.js { flash[:alert] = [["employment_date", "cannot be empty"]] }               
            else
                emp_date = Date.strptime(params[:user][:employment_attributes][:employment_date], "%m/%d/%Y")
                @employee = User.new(user_params)
                @employee.password = "ikealindseybautista"
                @employee.employment.employment_date = emp_date
                
                if @employee.save
                    #current_client.employments.create(user_id: @mployee.id, employment_type: emp_type, employment_date: emp_date )
                    format.json { head :no_content }
                    format.js { flash[:notice] = "User successfully created" }
                else
                    format.js { flash[:alert] = @employee.errors }
                end
            end
            @employees = current_client.users.employees
		end
    end

    private
    
        def user_params
            params.require(:user).permit(
                :email, :first_name, :last_name, :role, :employment,
                employment_attributes: [ :id, :employment_date, :employment_type, :client_id, :user_id, :_destroy ]
            )
        end
end