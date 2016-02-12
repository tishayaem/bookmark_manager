feature 'User can sing in' do
  scenario 'singing in as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, example@example.com')
    expect(User.first.email).to eq('example@example.com')
  end
end

feature 'Signing in' do

 scenario 'enter confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(email: 'example@example.com',
              password: '12345',
              password_confirmation: '12345')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

end
