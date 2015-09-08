class EtdPermalinkConstraint

  def matches?(request)
    path = request.fullpath.downcase

    path.include?('.php') ||
      path.include?('.html') ||
      path.include?('/photo/') ||
      path.include?('/notes/') ||
      path.include?('/profile/') ||
      path.include?('/profiles/') ||
      path.include?('/video/') ||
      path.include?('/main/')
  end

end
