class BuildingsController < CrudController
  before_action :set_building, only: [:show, :edit, :update, :destroy, :enable, :disable]

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

  def destroy
    @building.destroy
    respond_with(@building, location: edit_building_path(@building), responder: Buildings::DestroyResponder)
  end

  def enable
    Building.transaction do
      @building.enable
      flash[:notice] = t 'controllers.building.notices.was_enabled'
      redirect_to root_path(tab: 'building')
    end
  end

  def disable
    if @building.can_be_disabled?
      flash[:notice] = t 'controllers.building.notices.was_disabled'
    else
      flash[:error] = t 'controllers.building.errors.can_not_be_disabled'
    end
    redirect_to root_path(tab: 'building')
  end

  def update_keys
    if params[:source]
      keys = Key.codes_not_in_use(params[:source])
      render json: keys.to_json
    end
  end

  private
  def set_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:code, :person, :person_id, :building_type, :observation, :active, :status, :source, :name,
                                     address_attributes: [:id, :name, :number, :complement, :city, :neighborhood, :street_type, :observation, :cep],
                                     keys_attributes: [:id, :code, :observation, :_destroy])
  end
end
