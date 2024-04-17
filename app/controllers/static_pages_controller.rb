class StaticPagesController < ApplicationController
    def show
      @page = StaticPage.find_by(slug: params[:slug])
      render 'show'
    end
  end
  
