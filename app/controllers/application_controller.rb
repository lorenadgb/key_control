class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    redirect_to :new_real_state_agency unless real_state_agency?
  end

  def real_state_agency
    RealStateAgency.last
  end

  private

  def real_state_agency?
    real_state_agency
  end

end
