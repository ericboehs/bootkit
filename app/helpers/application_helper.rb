# Parent Helper that all Helpers inherit
module ApplicationHelper
    # The active_link_to gem may be a better alternative if we outgrow this
  def active_li_link_to name = nil, options = {}, html_options = {}, &block
    active = 'uk-active' if current_page? options
    content_tag :li, class: active do
      link_to name, options, html_options, &block
    end
  end
end
