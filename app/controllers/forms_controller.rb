class FormsController < ApplicationController
  before_action :set_form, only: [:create]
  def new
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)
    if @form.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def set_form
    @form = Form.find_by(params[:id])
  end

  def form_params
    params.require(:form).permit(:first_name, :last_name, :email, :phone, :address)
  end
end
