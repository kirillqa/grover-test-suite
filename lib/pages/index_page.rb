class IndexPage < SitePrism::Page

  set_url(EnvConfig.get :app_url)

  section :right_navbar, RightNavbarSection, '.navbar-right'
end