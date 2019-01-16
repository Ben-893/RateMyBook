def sign_up
  visit('/books')
  within ".navigation" do
    click_link('Sign up')
  end
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  click_button('Submit')
end
