selected_users = User.where("user_name LIKE ?", "%devmo%")
selected_users.each{ |u| p u.use_rname }
