class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  #attr_accessor :tip_index
  #attr_accessor :bet_week
	
	#rescue_from ActionView::MissingTemplate do |exception|
    #render "/layouts/application"
  #end
	
end
