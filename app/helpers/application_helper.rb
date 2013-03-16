module ApplicationHelper
  def login_nav
    if @auth.present?
      "<li>#{link_to(@auth.name, user_path(@auth.id))}</li>" +
      "<li>#{link_to('Log Out', '/login', :method => :delete, :remote => true)}</li>" +
      "<li>#{link_to('Apply', '#', :class => 'button tiny alert')}</li>"
    else
      "<li><a href='/login' data-dropdown='drop2'>Log In</a></li>" +
      "<ul id='drop2' class='f-dropdown content'>" +
      "<li>this is drop down content text</li></ul>" +
      "<li>#{link_to('Register', new_user_path, :remote => true)}</li>" +
      "<li>#{link_to('Log In', '/login', :remote => true)}</li>"

    end
  end
end
