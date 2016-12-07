class HomePage < SitePrism::Page

  set_url('/de')

  section :right_navbar, RightNavbarSection, '.navbar-right'
end