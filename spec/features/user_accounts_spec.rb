require 'web_helper'
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

 scenario 'if the password is wrong redirect to sign up page' do
   sign_up(password_confirmation: 'wrong')
   expect(page).to have_content('Password does not match the confirmation')

 end

 scenario 'if the user does not complete the email field.' do
   expect { sign_up(email: " ") }.not_to change(User, :count)
   sign_up(email: nil)
  #  expect(page).to have_content("Please enter your email address in the email field.")
 end

 scenario 'if the user does not enter a valid email address' do
   expect { sign_up(email: "reri.kdkd") }.not_to change(User, :count)
   sign_up(email: 'reri.kdkd')
  #  expect(page).to have_content("Please enter your email address in the email field.")
 end

 scenario 'if the user enters already taken email address' do
   sign_up(email: "reri.kdkd")
   expect { sign_up(email: "reri.kdkd") }.not_to change(User, :count)
  end
end
