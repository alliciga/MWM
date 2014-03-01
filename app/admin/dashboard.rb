ActiveAdmin.register_page "Dashboard" do

  menu :label => "综合调度", :priority => 1
  #menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    div :class => "blank_slate_container" do
      span :class => "blank_slate" do
        span "预警提示：车辆违章、车辆审验、周期性保养维修、人员体检、培训等。"
        span "指挥调度：直接IP语音拨号至：车辆、岗位、政府主管部门、医疗机构等。"
        span "信息发送：短信通知、手机应用通知"
      end
    end


  end # content
end
