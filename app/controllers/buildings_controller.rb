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
    @building = Building.new(building_params)

    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: 'Building was successfully created.' }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { render :new }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to @building, notice: 'Building was successfully updated.' }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  def enable
    Building.transaction do
      @building.enable
      flash[:notice] = 'Building was enabled.'
      redirect_to root_path
    end
  end

  def disable
    if @building.can_be_disabled?
      flash[:notice] = 'Building was disabled.'
    else
      flash[:error] = 'Building can not be disabled.'
    end
    redirect_to root_path
  end

  private
  def set_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:code, :person, :person_id, :building_type, :observation, :active,
                                     address_attributes: [:id, :name, :number, :complement, :city, :neighborhood, :street_type, :observation],
                                     keys_attributes: [:id, :code, :description])
  end
end
