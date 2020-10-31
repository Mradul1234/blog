class UsersPdf < Prawn::Document
	def initialize(users)
		super()
		@users = User.all.order(created_at: :desc)
		@users.each do |user|
			text user.username

		end

	end

	# def users_table
	# 	table users_list do
	# 		row(0).font_style = :bold
	# 		columns(1..3).align = :right
	# 		self.row_colors = ['DDDDDD','FFFFFF']
	# 		self.header = true
	# 	end
	# end

	# def users_list
	# 	[['User id','Username','First_name','Last_name','Email','Gender','Phone no','Description', 'Admin']]+
	# 	@users.each do |user|
	# 		[user.id, user.username, user.first_name, user.last_name, user.email,  user.gender,  user.phone_no, user.description, user.admin]
	# 	end
	# end
end