class NoGroupConstraint

  def matches?(request)
    path = request.fullpath.downcase
    group_id = path.split('/')[3]
    !Group.where(name: group_id).exists?
  end

end
