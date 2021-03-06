ActiveAdmin.register Organization do
  config.clear_action_items!

  action_item :if => proc{current_admin_user="admin@mwm.com"} do
    link_to('新增医疗机构', '/admin/organizations/new')
  end
  action_item do
    link_to('返回', '/admin/organizations')
  end

  menu :label => "医疗机构", :parent=>"基本数据管理", :priority => 5

  index :title => "医疗机构资料" do
    column "医疗机构名称",:name
    column "负责清运车" do |organization|
      auto_link organization.vehicle
    end
    column "医废产生量(桶)",:weight
    column "清运联系人",:contacts
    column "联系人电话",:contactsphone
    column "经度",:lon
    column "纬度",:lat
    default_actions
  end

  form do |f|
    f.inputs "医疗机构信息" do
      f.input :name, :label => "医疗机构名称"
      f.input :vehicle, :label => "负责清运车辆"
      f.input :weight, :label => "医废产生量（桶）"
      f.input :contacts, :label => "清运联系人"
      f.input :contactsphone, :label => "联系人电话"
      f.input :lon, :label => "医废库经度"
      f.input :lat, :label => "医废库纬度"
    end
    f.actions do
      f.action :submit, :label => "确认"
      f.action :cancel, :label => "取消"
    end
  end

  show do
    panel "医疗机构信息" do
      attributes_table_for organization do
        row("名称") {organization.name}
        row("负责清运车辆") {organization.vehicle}
        row("医废产生量（桶）") {organization.weight}
        row("清运联系人") {organization.contacts}
        row("联系人电话") {organization.contactsphone}
        row("医废库经度") {organization.lon}
        row("医废库纬度") {organization.lat}
      end
    end
  end

  filter :name, :label=>"名称"
  filter :vehicle_id, :label=>"清运车", :collection=> proc{Vehicle.all}, :as=>:select
  filter :lon, :label=>"经度"
  filter :lat, :label=>"纬度"
  filter :weight, :label=>"医废产生量"

end
