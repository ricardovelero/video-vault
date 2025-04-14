class Admin::VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin!

  def index
    @videos = current_user.videos
  end

  def new
    @video = Video.new
  end

  def create
    @video = current_user.videos.build(video_params)
    if @video.save
      redirect_to admin_videos_path, notice: "Video uploaded correctly"
    else
      render :new
    end
  end

  def show
    @video = current_user.videos.find(params[:id])
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :file)
  end

  def ensure_admin!
    redirect_to root_path, alert: "Not authorized" unless curren_user&.admin?
  end
end
