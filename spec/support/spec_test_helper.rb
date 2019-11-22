module SpecTestHelper

  def login_admin
    admin = User.create!(email: 'admin@recettes-test.com', username: "Admin", password: "123456", password_confirmation: "123456", admin: true)
    sign_in admin
    admin
  end

  def login_user
    user = User.create!(email: 'user@recettes-test.com', username: "User", password: "123456", password_confirmation: "123456", admin: false)
    sign_in user
    user
  end
end
