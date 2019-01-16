def sign_up
  visit('/books')
  within ".navigation" do
    click_link('Sign up')
  end
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  click_button('Submit')
end

def sign_in(email, password)
  visit '/sessions/new'
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  click_button('Sign in')

end

def fill_in_book(title, author, rating)
  fill_in('title', with: title)
  fill_in('author', with: author)
  fill_in('rating', with: rating)
  click_button('Submit')
end