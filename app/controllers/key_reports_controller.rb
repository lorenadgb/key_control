class KeyReportsController < CrudController

  def report
    @keys = Key.availables
    pdf = WickedPdf.new.pdf_from_string(
        render_to_string('report', layout: false)
    )
    send_data pdf, filename: 'keys.pdf', type: 'application/pdf', disposition: 'inline'
  end

  def not_in_use
    keys_not_in_use
  end

  def print_not_in_use
    keys_not_in_use
    pdf = WickedPdf.new.pdf_from_string(
        render_to_string(pdf: 'not_in_use', layout: false)
    )
    send_data pdf, filename: 'not_in_use.pdf', type: 'application/pdf', disposition: 'inline'
  end

  private

  def keys_not_in_use
    @rent_keys  = Key.codes_not_in_use(BuildingSource::RENT)
    @sale_keys  = Key.codes_not_in_use(BuildingSource::SALE)
  end
end
