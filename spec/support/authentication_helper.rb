module AuthenticationHelper

	def valid_signin(user, password)
		visit login_path
		fill_in "Email", with: user.email
		fill_in "Password", with: password
		click_button "Log In"
	end
end