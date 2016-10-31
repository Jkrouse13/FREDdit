class SubfredsController < ApplicationController



  def new
    @subfred = Subfred.new
  end

  def create
    @subfred = Subfred.new(subfred_params)
    @subfred.save
    if @subfred.save
      redirect_to root_path
    else
      render :new
    end
  end



  def edit
    render :new
  end

  def update
    @subfred.update(subfred_params)
    @subfred.save
    redirect_to :root
  end

private

  def find_subfred
    @subfred = Subfred.find(params[:id])
  end

  def subfred_params
    params.require(:subfred).permit(:name)
  end


end
