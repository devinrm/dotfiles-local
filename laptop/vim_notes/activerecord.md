selected_users = User.where("user_name LIKE ?", "%isabellasmith%")
selected_users.map{ |u| p u.user_name }

f << User.where.not(role: "Student").where.not(email_domain: nil).map { |user| user.email_domain }
f = File.new("whitelist_domains.rb", "w")
