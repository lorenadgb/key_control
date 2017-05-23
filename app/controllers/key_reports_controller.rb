class KeyReportsController < CrudController

  def report
    @keys = Key.availables
    pdf = WickedPdf.new.pdf_from_string(
        render_to_string('report', layout: false)
    )
    send_data pdf, filename: 'keys.pdf', type: 'application/pdf', disposition: 'inline'
  end
end
