class VisitsController < CrudController
  before_action :set_visit, only: [:show, :edit, :update, :destroy]

  def index
    @visits = Visit.all
  end

  def new
    @visit = Visit.new
  end

  def create
    @visit = Visit.create(visit_params)
    respond_with(@visit, location: @visit)
  end

  def update
    @visit.update(visit_params)
    respond_with(@visit, location: @visit)
  end

  def destroy
    @visit.destroy
    respond_with(@visit, location: root_path)
  end

  def update_keys
    if params[:building_id]
      keys = Key.by_building_id(params[:building_id]).availables
      render json: keys.to_json(only: [:id, :code])
    end
  end

  def update_buildings
    if params[:person_id]
      buildings = Building.by_person_id(params[:person_id]).actives
      render json: buildings.to_json(only: [:id, :code])
    end
  end

  def update_owner
    if params[:building_id]
      owner = Person.by_building_id(params[:building_id]).owners
      render json: owner.to_json(only: [:id, :name])
    end
  end

  private
    def set_visit
      @visit = Visit.find(params[:id])
    end

    def visit_params
      params.require(:visit).permit(:key, :key_id, :building, :building_id, :owner, :owner_id, :visitor, :visitor_id,
                                    :realtor, :realtor_id, :start_at, :finished_at, :observation)
    end
end
