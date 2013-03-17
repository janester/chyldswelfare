module ApplicationHelper
  def login_nav
    if @auth.present?
      "<li>#{link_to(@auth.name, user_path(@auth.id))}</li>" +
      "<li class='divider hide-for-small'></li>" +
      "<li>#{link_to('Log Out', login_path, :method => :delete, :confirm => 'Are you sure you want to log out?')}</li>" +
      "<li class='divider hide-for-small'></li>" +
      "<li class='has-form'>#{link_to('Apply', '#', :class => 'button tiny alert')}</li>"
    else
      # "<li><a href='/login' data-dropdown='drop2'>Log In</a></li>" +
      # "<ul id='drop2' class='f-dropdown content'>" +
      # "<li>this is drop down content text</li></ul>" +
      "<li>#{link_to('Register', new_user_path, :remote => true)}</li>" +
      "<li class='divider hide-for-small'></li>" +
      "<li>#{link_to('Log In', '/login')}</li>"

    end
  end
end
