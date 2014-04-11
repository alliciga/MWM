ActiveAdmin.register_page "Map" do
  menu :label => "车辆实时GIS监控", :priority => 2

  content :title =>"车辆实时GIS监控" do
    text_node %{<iframe src="http://115.28.4.156:9998/mapshow/flexview/index.html" width="100%" height="800" frameborder="no"></iframe>}.html_safe
  end
end
