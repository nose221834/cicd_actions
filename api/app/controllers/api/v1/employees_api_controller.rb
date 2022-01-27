class Api::V1::EmployeesApiController < ApplicationController

  def get_employee_index_for_admin_view
    @employees = Employee.with_groups
    render json: fmt(ok, @employees)
  end

  def get_employee_show_for_admin_view
    @employee = Employee.with_group(params[:id])
    render json: fmt(ok, @employee)
  end

  def get_employees
    # 従業員の一覧を取得する
    employees = Employee.all
    employees_list = []
    for employee in employees
      group = employee.group.name
      employees_list << {
        employee: employee,
        group: group,
      }
    end
    render json: employees_list
  end

  def get_employee
    # 従業員の詳細を取得する
    employee = Employee.find(params[:id])
    employees_list = []
    group = employee.group.name
    employees_list = {
      employee: employee,
      group: group,
    }
    render json: employees_list
  end

end
