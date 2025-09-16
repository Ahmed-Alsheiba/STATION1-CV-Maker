class PagesController < ApplicationController
  def home
  end
  def examples
    @forms = Form.all
  end
end
