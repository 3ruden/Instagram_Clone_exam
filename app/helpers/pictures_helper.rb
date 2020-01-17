module PicturesHelper
  def ensure_correct_user
    unless current_user.pictures.ids.include?(params[:id].to_i)
      redirect_to pictures_url, notice: "権限がありあせん"
    end
  end
end

