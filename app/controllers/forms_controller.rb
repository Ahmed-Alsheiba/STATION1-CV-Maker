class FormsController < ApplicationController
  before_action :set_form, only: [:create, :show]
  def new
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)
    @form.user = current_user
    if @form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private
  def set_form
    @form = Form.find_by(id: params[:id])
  end

  def form_params
    params.require(:form).permit(:first_name, :last_name, :email, :phone, :address, :photo, :user_id, :degree, :college, :degree_starting_year, :degree_finishing_year, :skills, :languages, :prev_job_title, :prev_company, :prev_company_address, :prev_job_starting_year, :prev_job_ending_year, :about_prev_job )
  end
end
