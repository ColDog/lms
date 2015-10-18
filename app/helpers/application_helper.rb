module ApplicationHelper
  def edit_employees?
    current_user.role.super_user || current_user.role.can_edit_employees
  end
  def edit_own?
    current_user.role.super_user || current_user.role.can_edit_own
  end
  def create_content?
    current_user.role.super_user || current_user.role..can_create_content
  end
  def super_user?
    current_user.role.super_user
  end

  def create_content!
    unless create_content?
      unauthorized!
    end
  end

  def edit_own!
    unless super_user? || edit_own?
      unauthorized!
    end
  end

  def edit_employees!
    unless super_user? || edit_employees?
      unauthorized!
    end
  end

  def unauthorized!
    flash[:danger] = 'You do not have the permissions'
    redirect_to '/'
  end
end
