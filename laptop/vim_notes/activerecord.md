selected_users = User.where("user_name LIKE ?", "%isabellasmith%")
selected_users.map{ |u| p u.user_name }
