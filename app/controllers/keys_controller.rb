class KeysController < CrudController
  before_action :set_key, only: [:show, :edit, :update, :destroy]

  def index
    @keys = Key.paginate(:page => params[:page])
  end

  def create
    @key = Key.create(key_params)
    respond_with(@key, location: @key)
  end

  def update
    @key.update(key_params)
    respond_with(@key, location: @key)
  end

  def destroy
    @key.destroy
    respond_with(@key, location: root_path)
  end

  def set_status_to_available
    key_id = params[:key_id]
    visit = Visit.by_key_id(key_id)

    Visit.transaction do
      visit.set_status_to_available
      visit.update_finished_at
      redirect_to root_path
    end
  end

  private
    def set_key
      @key = Key.find(params[:id])
    end

    def key_params
      params.require(:key).permit(:code, :observation)
    end
end
