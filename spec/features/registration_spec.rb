feature 'registration' do
  scenario 'a user can sign up' do
    sign_up
    expect(page).to have_content "Welcome, test@example.com"
  end

  scenario 'a user sees an error if they already exist' do
    User.create(email: 'test@example.com', password: 'password123')
    sign_up
    expect(page).to have_content "This user already exists."
  end
end