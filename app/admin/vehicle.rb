ActiveAdmin.register Vehicle do
  config.clear_action_items!

  action_item :if => proc{current_admin_user="admin@mwm.com"} do
    link_to('新增清运车', '/admin/vehicles/new')
  end

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

  form do |f|
    f.inputs "车辆信息" do |vehicle|
      f.input :name, :label => "车牌号码"
      f.input :vehicletype, :label => "车辆类型"
      f.input :driver, :label => "司机"
      f.input :worker, :label => "清运工"
      f.input :gpsphone, :label => "车载台号码"
      f.input :nextcheckdate, :label => "计划审车时间"
      f.input :lastmaintdate, :label => "上次检修时间"
    end
    f.actions do
      f.action :submit, :label => "确认"
      f.action :cancel, :label => "取消"
    end
  end

end
