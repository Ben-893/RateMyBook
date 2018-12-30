feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome, test@example.com"
  end

  scenario 'a user sees an error if they already exist' do
    User.create(email: 'ben@example.com', password: 'password123')
    visit '/users/new'
    fill_in('email', with: 'ben@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
    expect(page).to have_content "This user already exists."
  end
end