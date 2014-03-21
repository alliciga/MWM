ActiveAdmin.register Worker do
  config.clear_action_items!

  action_item :if => proc{current_admin_user="admin@mwm.com"} do
    link_to('新增清运工', '/admin/workers/new')
  end

  menu :label => "清运工", :parent => "人员", :priority => 6

  index :title => "清运工资料"  do
    column "姓名",:name
    column "身份证号",:certid
    column "电话",:phone
    column "上次体检日期",:lastcheckdate

    default_actions
  end

  filter :lastcheckdate, :label=>"上次体检日期"

  form do |f|
    f.inputs "清运工信息" do
      f.input :name, :label => "姓名", :required => true
      f.input :certid, :label => "身份证号"
      f.input :phone, :label => "电话号码"
      f.input :lastcheckdate, :label => "上次体检日期"
    end
    f.actions do
      f.action :submit, :label => "确认"
      f.action :cancel, :label => "取消"
    end
  end
end
