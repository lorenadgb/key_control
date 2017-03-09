class PeopleController < CrudController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.paginate(:page => params[:page])
  end

  def new
    @person = Person.new
    @person.build_address
  end

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:name, :mother, :father, :cpf, :nationality, :gender, :birthdate,
                                     :email, :phone_number, :mobile_number, :fax, :personable_type,
                                     address_attributes: [:id, :name, :number, :complement, :city, :neighborhood, :street_type, :observation])
    end
end
