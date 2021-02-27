class Api::V1::LinksController < ApplicationController
  def index
    links = Link.all
    render json: {links: links}
  end

  def show
    link = Link.find_by(slug: params[:slug])
    redirect_to link.url
  end

  def create
    new_link = Link.new(link_params)
    if new_link.save
      render json: {new_link: new_link}
    else
      render json: {message: 'failed'}
    end
  end

  def destroy
    link = Link.find(params[:id])
    if link.destroy
      render json: {message: 'link deleted'}
    else
      render json: {message: 'failed'}
    end
  end

  private

    def link_params
      params.permit(:user_id, :url, :slug)
    end
end
