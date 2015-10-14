ActiveAdmin.register_page "MapBaiduTools1" do
  menu :label => "坐标拾取", :parent=>"地图工具", :priority => 5

  content :title =>"地图工具-坐标拾取" do
    text_node %{<iframe src="http://api.map.baidu.com/lbsapi/getpoint/index.html" width="100%" height="800" frameborder="no"></iframe>}.html_safe
  end
end
