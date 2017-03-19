class BuildingsController < CrudController
  before_action :set_building, only: [:show, :edit, :update, :destroy]

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

  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to buildings_url, notice: 'Building was successfully destroyed.' }
      format.json { head :no_content }
    end
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
