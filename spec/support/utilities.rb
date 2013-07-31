def full_title(page_title)
  base_title = "Demo App"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end  
end  

def sign_in(user)
  visit new_user_session_path
  fill_in "Email",    with: user.email.upcase
  fill_in "Password", with: user.password
  click_button "Sign in"
end  
