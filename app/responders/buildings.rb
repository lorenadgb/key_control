module Buildings
  class DestroyResponder < ApplicationResponder
    def to_html
      if resource.destroy
        flash[:notice] = t('flash.buildings.destroy.notice', resource_name: resource.model_name.human)
      else
        flash[:alert] = resource.errors.full_messages.to_sentence
      end
    end
  end
end
