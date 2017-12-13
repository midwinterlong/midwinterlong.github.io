module CustomHelpers

  def active_class(link_path)
     current_page.url == link_path ? 'is-active' : ""
  end

end