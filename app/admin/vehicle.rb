ActiveAdmin.register Vehicle do
  menu :label => "车辆信息", :parent => "清运车辆", :priority => 7

  index :title => "清运车辆资料" do
    column "车牌号码",:name
    column "车辆类型" do |vehicle|
      auto_link vehicle.vehicletype
    end
    column "司机" do |vehicle|
      auto_link vehicle.driver
    end
    column "清运工" do |vehicle|
      auto_link vehicle.worker
    end
    column "车载号码",:gpsphone
    column "计划审车时间",:nextcheckdate
    column "上次检修时间",:lastmaintdate
    default_actions
  end


  filter :vehicletype, :label=>"车辆类型"

  action_item :only => :show, :if => proc{current_admin_user="admin@mwm.com"} do
    link_to('新增清运车', '/admin/vehicles/new')
  end
end
