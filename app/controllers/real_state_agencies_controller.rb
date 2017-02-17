class RealStateAgenciesController < ApplicationController
  before_action :set_real_state_agency, only: [:show, :edit, :update, :destroy]

  # GET /real_state_agencies
  # GET /real_state_agencies.json
  def index
    @real_state_agencies = RealStateAgency.all
  end

  # GET /real_state_agencies/1
  # GET /real_state_agencies/1.json
  def show
  end

  # GET /real_state_agencies/new
  def new
    @real_state_agency = RealStateAgency.new
    @real_state_agency.build_address
  end

  # GET /real_state_agencies/1/edit
  def edit
  end

  # POST /real_state_agencies
  # POST /real_state_agencies.json
  def create
    @real_state_agency = RealStateAgency.new(real_state_agency_params)

    respond_to do |format|
      if @real_state_agency.save
        format.html { redirect_to @real_state_agency, notice: 'Real state agency was successfully created.' }
        format.json { render :show, status: :created, location: @real_state_agency }
      else
        format.html { render :new }
        format.json { render json: @real_state_agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /real_state_agencies/1
  # PATCH/PUT /real_state_agencies/1.json
  def update
    respond_to do |format|
      if @real_state_agency.update(real_state_agency_params)
        format.html { redirect_to @real_state_agency, notice: 'Real state agency was successfully updated.' }
        format.json { render :show, status: :ok, location: @real_state_agency }
      else
        format.html { render :edit }
        format.json { render json: @real_state_agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /real_state_agencies/1
  # DELETE /real_state_agencies/1.json
  def destroy
    @real_state_agency.destroy
    respond_to do |format|
      format.html { redirect_to real_state_agencies_url, notice: 'Real state agency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_real_state_agency
      @real_state_agency = RealStateAgency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def real_state_agency_params
      params.require(:real_state_agency).permit(:trade_name, :cnpj, :email, :mobile_number, :phone_number, :fax, :social_name,
                                                address_attributes: [:id, :name, :number, :complement, :city, :neighborhood, :street_type, :observation])
    end
end
