module PicsHelper
  def user_allowed?
    unless @pic.user == current_user || current_user.try(:admin?)
      flash[:allert] = 'Accsess denied'
      redirect_to @pic
    end
  end

  def viuser_allowed?
    @pic.user == current_user || current_user.try(:admin?)
  end
end
