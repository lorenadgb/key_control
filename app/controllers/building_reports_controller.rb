class BuildingReportsController < CrudController

  def generate
    if params[:building_report]
      if find_buildings.any?
        generate_report(find_buildings)
      else
        flash[:error] = I18n.t 'controllers.building_report.errors.not_found'
      end
    end
  end

  def generate_report(buildings)
    @buildings = buildings
    pdf = WickedPdf.new.pdf_from_string(
        render_to_string('report', layout: false)
    )
    send_data pdf, filename: 'buildings.pdf', type: 'application/pdf', disposition: 'inline'
  end

  private

  def find_buildings
    @buildings = BuildingReport.filter(params[:building_report])
  end

  protected

  def building_report_params
    params[:building_report].permit(:all, :active, :source, :status, :building_type, :owner, :initial_sequence, :final_sequence)
  end
end
