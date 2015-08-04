require "spec_helper"

feature "Signup" do
	scenario "when sending valid info" do
		visit "/"

		click_link "Signup"
		fill_in "user_full_name", with: "John Doe"
		fill_in "user_email",with: "john@example.org"
		fill_in "user_password", with: "test"
		fill_in "user_password_confirmation", with: "test"
		fill_in "user_bio", with: "My name is John i'm an nice men and search frineds"
		click_button "Create User"

		#expect(current_path).to match(%r{users/\+d} )
		#expect(page).to have_content("Cadastro realizado com sucesso!")
	end
end