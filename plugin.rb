# name: discourse-estudiabetes
# about: Customizations for www.estudiabetes.org/forum
# version: 0.3
# authors: Neil Lalonde

register_css <<CSS
.wordpress-preferences-link {
  margin-top: 32px;
  margin-bottom: 24px;
}
.wordpress-preferences-link a {
  text-decoration: underline;
}
CSS

after_initialize do
  require_dependency File.expand_path('../app/controllers/etd_permalinks_controller.rb', __FILE__)
  require_dependency File.expand_path('../lib/etd_permalink_constraint.rb', __FILE__)
  require_dependency File.expand_path('../lib/no_group_constraint.rb', __FILE__)

  Discourse::Application.routes.prepend do
    # A lot of Ning urls use "group" and "groups" as a synonym for "topic". Stop showing access denied page.
    get '/groups/:id', to: redirect('http://www.estudiabetes.org/foro'), constraints: NoGroupConstraint.new
    get '/group/:id', to: redirect('http://www.estudiabetes.org/foro'), constraints: NoGroupConstraint.new
  end

  Discourse::Application.routes.append do
    get "*url", to: 'etd_permalinks#show', constraints: EtdPermalinkConstraint.new
  end
end
