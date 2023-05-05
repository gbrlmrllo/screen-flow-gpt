class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :pages

  private

  def pages
    @pages = current_user.project.pages
  end
end
