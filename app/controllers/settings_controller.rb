class SettingsController < CrudController

  protected

  def setting_params
    params[:setting].permit(:display_blank_codes, :keychain_height, :keychain_width)
  end
end
