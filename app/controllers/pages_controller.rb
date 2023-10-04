class PagesController < ApplicationController
  def home
  end

  def page
    @page_key = request.path[1..-1]
    render "pages/#{@page_key}"
  end
end
