class WelcomePage < ApplicationPage
  set_url url_helpers.root_path

  section :navbar, NavbarSection, ".navbar"
end
