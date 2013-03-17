module ApplicationHelper
  def login_nav
    if @auth.present?
      "<li>#{link_to(@auth.name, user_path(@auth.id))}</li>" +
      "<li class='divider hide-for-small'></li>" +
      "<li>#{link_to('Log Out', login_path, :method => :delete, :confirm => 'Are you sure you want to log out?')}</li>" +
      "<li class='divider hide-for-small'></li>" +
      "<li class='has-form'>#{link_to('Apply', '#', :class => 'button tiny alert')}</li>"
    else

      "<li class='has-dropdown'><a href='/login'>Login</a>
        <ul class='dropdown'>
          <li>#{render :partial => "session/new"}</li>
          </ul>
      </li>"+
      "<li class='divider hide-for-small'></li>" +
      "<li>#{link_to('Register', new_user_path, :remote => true)}</li>"


    end
  end
end
