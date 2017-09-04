class EtdPermalinksController < ApplicationController
  skip_before_action :check_xhr, :preload_json

  def show
    # EtdPermalinkConstraint controls when this happens
    redirect_to("http://www.estudiabetes.org", status: :moved_permanently)
  end

end
