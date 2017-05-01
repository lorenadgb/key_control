class BuildingsController < CrudController
  before_action :set_building, only: [:show, :edit, :update, :enable, :disable]

  def index
    @buildings = Building.paginate(:page => params[:page])
  end

  def new
    @building = Building.new
    @building.build_address
    @building.keys.build
  end

  def create
    @building = Building.create(building_params)
    respond_with(@building, location: @building)
  end

  def update
    @building.update(building_params)
    respond_with(@building, location: @building)
  end

  def enable
    Building.transaction do
      @building.enable
      flash[:notice] = t 'controllers.building.notices.was_enabled'
      redirect_to root_path
    end
  end

  def disable
    if @building.can_be_disabled?
      flash[:notice] = t 'controllers.building.notices.was_disabled'
    else
      flash[:error] = t 'controllers.building.notices.can_not_be_disabled'
    end
    redirect_to root_path
  end

  private
  def set_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:code, :person, :person_id, :building_type, :observation, :active, :status,
                                     address_attributes: [:id, :name, :number, :complement, :city, :neighborhood, :street_type, :observation, :cep],
                                     keys_attributes: [:id, :code, :description, :_destroy])
  end
end
