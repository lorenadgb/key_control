class KeychainsController < CrudController

  def print
    if params[:keychain]
      if find_keys.any?
        print_keychains(find_keys)
      else
        flash[:error] = I18n.t 'controllers.keychain.errors.not_found'
      end
    end
  end

  def print_keychains(keys)
    @keys = keys
    pdf = WickedPdf.new.pdf_from_string(
        render_to_string('print_keychains', layout: false)
    )
    send_data pdf, filename: 'keychains.pdf', type: 'application/pdf', disposition: 'inline'
  end

  private

  def find_keys
    @keys = Keychain.filter(params[:keychain])
  end

  protected

  def keychain_params
    params[:keychain].permit(:all, :key_code, :building, :owner)
  end
end
