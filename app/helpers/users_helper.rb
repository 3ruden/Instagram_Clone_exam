module UsersHelper
  def ensure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to users_url, notice: "権限がありません"
    end
  end
end
