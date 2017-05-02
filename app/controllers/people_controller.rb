class PeopleController < CrudController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.paginate(:page => params[:page])
  end

  def new
    @person = Person.new
    @person.personable_type = params[:personable_type] unless params[:personable_type].nil?
    @person.build_address
  end

  def create
    @person = Person.create(person_params)
    respond_with(@person, location: @person)
  end

  def update
    @person.update(person_params)
    respond_with(@person, location: @person)
  end

  def destroy
    @person.destroy
    respond_with(@person, location: root_path(tab: @person.personable_type), responder: People::DestroyResponder)

    redirect_to root_path(tab: @person.personable_type)
  end

  private
    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:name, :mother, :father, :cpf_cnpj, :nationality, :gender, :birthdate,
                                     :email, :phone_number, :mobile_number, :fax, :personable_type, :person_type,
                                     address_attributes: [:id, :name, :number, :complement, :city, :neighborhood, :street_type, :observation, :cep])
    end
end
