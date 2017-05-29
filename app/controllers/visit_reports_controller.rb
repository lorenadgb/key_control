class VisitReportsController < CrudController

  def generate
    if params[:visit_report]
      if find_visits.any?
        generate_report(find_visits)
      else
        flash[:error] = I18n.t 'controllers.visit_report.errors.not_found'
      end
    end
  end

  def generate_report(visits)
    @visits = visits
    pdf = WickedPdf.new.pdf_from_string(
        render_to_string('report', layout: false)
    )
    send_data pdf, filename: 'visits.pdf', type: 'application/pdf', disposition: 'inline'
  end

  private

  def find_visits
    @visits = VisitReport.filter(params[:visit_report])
  end

  protected

  def visit_report_params
    params[:visit_report].permit(:start, :finish, :realtor, :visitor, :owner, :building)
  end
end
