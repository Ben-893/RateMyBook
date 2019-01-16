feature 'authentication' do
  it 'a user can sign in' do
    User.create(email: 'ben@example.com', password: 'password123')
    sign_in('ben@example.com', 'password123')
    expect(page).to have_content 'Welcome, ben@example.com'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(id: 4, email: 'test@example.com', password: 'password123')
    sign_in('nottherightemail@me.com', 'password123')
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Incorrect email or password combination. Please check your email or password and try again'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(email: 'test@example.com', password: 'password123')
    sign_in('test@example.com', 'wrongpassword')
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Incorrect email or password combination. Please check your email or password and try again'
  end
end