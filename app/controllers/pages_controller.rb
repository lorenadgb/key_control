class PagesController < CrudController

  def index
    @buildings = Building.paginate(page: params[:page])
    @keys      = Key.paginate(page: params[:page])
    @people    = Person.paginate(page: params[:page])
  end
end
