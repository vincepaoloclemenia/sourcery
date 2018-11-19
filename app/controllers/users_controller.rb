class UsersController < ApplicationController
    before_action :find_employee, only: [:edit, :update]

    def create_user
        respond_to do |format|
            @employee = User.new(user_params)
            if @employee.employment.employment_date.present?
                emp_date = Date.strptime(params[:user][:employment_attributes][:employment_date], "%m/%d/%Y")
                
                @employee.password = "ikealindseybautista"
                @employee.employment.employment_date = emp_date
                
                if @employee.save
                    #current_client.employments.create(user_id: @mployee.id, employment_type: emp_type, employment_date: emp_date )
                    format.json { head :no_content }
                    format.js { flash[:notice] = "User successfully created" }
                else
                    format.js { flash[:alert] = @employee.errors }
                end
            else
                format.js { flash[:alert] = [["employment_date", "cannot be empty"]] } 
            end
            @employees = current_client.users.employees
		end
    end

    def edit
        @employment = @employee.employment
        @choices = [["Regular", "Regular"], ["Contractual", "Contractual"]]
    end

    def update
        respond_to do |format|
            emp_date = Date.strptime(params[:user][:employment_attributes][:employment_date], "%m/%d/%Y")
            
            if @employee.update(user_params)
                @employee.employment.update(employment_date: emp_date)
                #current_client.employments.create(user_id: @mployee.id, employment_type: emp_type, employment_date: emp_date )
                format.json { head :no_content }
                format.js { flash[:notice] = "#{@employee.full_name} account successfully updated" }
            else
                format.js { flash[:alert] = @employee.errors }
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

        def find_employee
            @employee = User.find params[:id]
        end
end