Question.delete_all
Quiz.delete_all
User.delete_all

PASSWORD = "superadmin"
NUM_OF_CREATES = 100

super_user = User.create(
  first_name: "Test",
  last_name: "User",
  email: "test@user.com",
  password: PASSWORD,
  admin: true
)
