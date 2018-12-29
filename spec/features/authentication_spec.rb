feature 'authentication' do
  it 'a user can sign in' do
    User.create(email: 'ben@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'ben@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, ben@example.com'
  end
end