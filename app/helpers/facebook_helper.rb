module FacebookHelper
  def fb_tab_item(controller_name)
    "<fb:tab-item href='#{url_for(:controller => controller_name)}' title='#{controller_name.titleize}' selected='#{controller.controller_name == controller_name}' />"
  end
end
