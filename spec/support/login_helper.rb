# frozen_string_literal: true

require 'rack_session_access/capybara'

module LoginHelper
  def login_as(user)
    page.set_rack_session(user_id: user.id)
  end
end
