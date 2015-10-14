ActiveAdmin.register_page "HistoryTrack" do
  menu :label => "历史轨迹", :priority => 5

  content :title =>"历史轨迹查询" do
    text_node "用户名：admin，密码：123456"
    text_node %{<iframe src="http://115.28.4.156:7000" width="100%" height="800" frameborder="no"></iframe>}.html_safe
  end
end
