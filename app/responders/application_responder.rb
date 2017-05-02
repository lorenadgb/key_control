class ApplicationResponder < ActionController::Responder
  include Responders::FlashResponder

  delegate :t, :flash, to: :controller
end
