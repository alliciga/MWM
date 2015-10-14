ActiveAdmin.register_page "MapBaiduTools2" do
  menu :label => "坐标转换", :parent=>"地图工具", :priority => 5

  content :title =>"地图工具-坐标转换" do
    text_node %{<iframe src="http://minigps.net/convert.html" width="100%" height="800" frameborder="no"></iframe>}.html_safe
  end
end
