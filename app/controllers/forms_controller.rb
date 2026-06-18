class FormsController < ApplicationController
  before_action :set_form, only: [:create, :show]
  def new
    @form = Form.new
    # Build one empty child of each kind so the create form shows a first row.
    @form.experiences.build
    @form.educations.build
    @form.skills.build
    @form.languages.build
    @form.cv_references.build
    @form.certifications.build
  end

  def create
    @form = Form.new(form_params)
    if current_user
      @form.user = current_user
    else
      @form.user = User.first
    end
    if @form.save
      redirect_to form_path(@form)
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
    params.require(:form).permit(
      :first_name, :last_name, :email, :phone, :address, :photo, :user_id,
      :about_you, :template,
      experiences_attributes:    [:id, :job_title, :company, :location, :start_date, :end_date, :description, :position, :_destroy],
      educations_attributes:     [:id, :degree, :institution, :start_date, :end_date, :position, :_destroy],
      skills_attributes:         [:id, :name, :level, :position, :_destroy],
      languages_attributes:      [:id, :name, :level, :position, :_destroy],
      cv_references_attributes:  [:id, :name, :title, :company, :phone, :email, :position, :_destroy],
      certifications_attributes: [:id, :name, :position, :_destroy]
    )
  end
end
