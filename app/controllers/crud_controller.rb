class CrudController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  private

  def authorize_admin
    redirect_to root_path unless current_user.admin?
  end

end
