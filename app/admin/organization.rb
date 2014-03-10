ActiveAdmin.register Organization do
  menu :label => "医疗机构", :priority => 5

  index :title => "医疗机构资料" do
    column "名称",:name
    column "清运车" do |organization|
      auto_link organization.vehicle
    end
    column "医废产生量(桶)",:weight
    column "清运联系人",:contacts
    column "联系人电话",:contactsphone
    column "经度",:lon
    column "纬度",:lat
    default_actions
  end

#  show :title=>"医疗机构详情" do |organization|
#    h3 organization.name
#    text_node "<h3>负责清运车辆：</h3>".html_safe
#    h3 organization.vehicle.name
#  end

  action_item :only => :show, :if => proc{current_admin_user="admin@mwm.com"} do
    link_to('新增医疗机构', '/admin/organizations/new')
  end

  filter :name, :label=>"名称"
  filter :vehicle_id, :label=>"清运车", :collection=> proc{Vehicle.all}, :as=>:select
  filter :lon, :label=>"经度"
  filter :lat, :label=>"纬度"
  filter :weight, :label=>"医废产生量"

end
