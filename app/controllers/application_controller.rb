class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_author!
  def after_sign_in_path_for(resource_or_scope)
    author_papers_path(current_author)
  end
  
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
