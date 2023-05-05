class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :pages, if: :current_user

  private

  def pages
    @pages = current_user.project.pages
  end
end
