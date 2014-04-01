ActiveAdmin.register_page "Dashboard" do

  menu :label => "综合调度", :priority => 1

  content :title => "医废处置综合调度管理" do
    div :class => "blank_slate_container" do
      span :class => "blank_slate" do
        h2 "本单位目前共承担 " + Organization.count.to_s + " 个医疗机构的医废清运工作，由 " + Vehicle.count.to_s + " 辆清运车，" + Worker.count.to_s + " 位清运工完成。"
        span "预警提示：车辆违章、车辆审验、周期性保养维修、人员体检、培训等。"
        span "指挥调度：直接IP语音拨号至：车辆、岗位、政府主管部门、医疗机构等。"
        span "信息发送：短信通知、手机应用通知"
      end
    end

  end # content

end
