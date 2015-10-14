ActiveAdmin.register_page "MapBaidu" do
  menu :label => "Baidu版实时监控", :priority => 2

  content :title =>"车辆实时GIS监控（百度版）" do
    text_node %{<iframe src="http://115.28.33.87/baidumap.html" width="100%" height="800" frameborder="no"></iframe>}.html_safe
  end
end
