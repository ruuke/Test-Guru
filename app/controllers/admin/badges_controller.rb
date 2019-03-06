class Admin::BadgesController < Admin::BaseController

  before_action :find_badge, only: %i[show edit update destroy]

  def index    
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.create(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: 'Badge created!'
    else
      render :new
    end
  end


  def edit
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: 'Badge updated!'
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy

    redirect_to admin_badges_path, notice: 'Badge deleted!'
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :image)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

end
