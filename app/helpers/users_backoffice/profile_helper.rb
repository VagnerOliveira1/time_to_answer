module UsersBackoffice::ProfileHelper
  def gender_select(user, current_gender)
    user.user_profile.gender == 'M' ? 'btn-primary' : 'btn-default'   
  end
end