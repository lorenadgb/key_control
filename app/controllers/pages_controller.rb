class PagesController < CrudController

  def index
    @buildings = Building.all
    @keys      = Key.all
    @people    = Person.all
  end
end
