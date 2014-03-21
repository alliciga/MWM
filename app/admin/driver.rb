ActiveAdmin.register Driver do
  config.clear_action_items!

  action_item :if => proc{current_admin_user="admin@mwm.com"} do
    link_to('新增司机', '/admin/drivers/new')
  end

  menu :label => "司机", :parent => "人员", :priority => 6

  index :title => "司机资料"  do
    column "姓名",:name
    column "身份证号",:certid
    column "电话",:phone
    column "上次体检日期",:lastcheckdate
    default_actions
  end

  filter :lastcheckdate, :label=>"上次体检日期"

  form do |f|
    f.inputs "司机信息" do
      f.input :name, :label => "姓名"
      f.input :certid, :label => "身份证号"
      f.input :phone, :label => "电话"
      f.input :lastcheckdate, :label => "上次体检日期"
    end
    f.actions do
      f.action :submit, :label => "确认"
      f.action :cancel, :label => "取消"
    end
  end
end
