class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_page, only: [:show, :edit, :update, :destroy]


  def show
  end

  def new
    @page = current_user.project.page.new
  end

  def create
    @page = @page.new(page_params)

    if @page.save
      redirect_to page_path(@page), notice: 'Página creada exitosamente.'
    else
      render :new
    end
  end

  def update
    @page.messages.create(content: set_message, role: :user)
    open_client = OpenAiService.new
    @response = open_client.call_openai(@page.messages).remove("```")
    @page.messages.create(content: @response, role: :assistant)
    @page.update(content: @response)
    redirect_to page_path(@page), notice: 'Página creada exitosamente.'
  end

  def destroy
    @page.destroy
    redirect_to page_path(@page), notice: 'Página eliminada exitosamente.'
  end

  private

  def set_page
    @page = current_user.project.pages.find(params[:id])
  end

  def set_message
    "You will provide only HTML for the requirement  delimited by <#{params[:message]}>"
  end

  def page_params
    params.require(:page).permit(:title, :content)
  end
end
