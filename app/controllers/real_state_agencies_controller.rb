class RealStateAgenciesController < CrudController
  before_action :set_real_state_agency, only: [:show, :edit, :update]
  before_filter :authorize_admin, only: [:new, :create, :update]

  def index
    @real_state_agencies = RealStateAgency.all
  end

  def new
    @real_state_agency = RealStateAgency.new
    @real_state_agency.build_address
  end

  def create
    @real_state_agency = RealStateAgency.create(real_state_agency_params)
    respond_with(@real_state_agency, location: @real_state_agency)
  end

  def update
    @real_state_agency.update(real_state_agency_params)
    respond_with(@real_state_agency, location: @real_state_agency)
  end

  private
    def set_real_state_agency
      @real_state_agency = RealStateAgency.find(params[:id])
    end

    def real_state_agency_params
      params.require(:real_state_agency).permit(:trade_name, :cnpj, :email, :mobile_number, :phone_number, :fax, :social_name,
                                                :avatar,
                                                address_attributes: [:id, :name, :number, :complement, :city, :neighborhood, :street_type, :observation])
    end
end
