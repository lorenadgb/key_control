class KeychainsController < CrudController

  before_action :find_keys, only: :print

  def print
    if params[:keychain]
      if find_keys.any?
        @keys = find_keys
        respond_to do |format|
          format.html { redirect_to print_keychains_keys_path }
        end
      else
        flash[:error] = 'Was not found any keys with the params.'
      end
    end
  end

  def print_keychains
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
