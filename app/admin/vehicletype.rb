ActiveAdmin.register Vehicletype do
  config.clear_action_items!

  action_item :if => proc{current_admin_user="admin@mwm.com"} do
    link_to('新增车辆类型', '/admin/vehicletypes/new')
  end
  action_item do
    link_to('返回', '/admin/vehicletypes')
  end

  menu :label => "清运车类型", :parent => "基本数据管理", :priority => 5

  index :title => "车辆类型" do
    column "类型名称",:name
    column "载货量（吨）",:capacity
    column "综合油耗",:fuel
    column "维检周期",:maintcycle
    default_actions
  end

  filter :capacity, :label=>"载货量"

  form do |f|
    f.inputs "车辆类型" do
      f.input :name, :label => "类型名称"
      f.input :capacity, :label => "载货量（吨）"
      f.input :fuel, :label => "综合油耗"
      f.input :maintcycle, :label => "维护保养周期"
    end
    f.actions do
      f.action :submit, :label => "确认"
      f.action :cancel, :label => "取消"
    end
  end

  show do |v|
    panel "车辆类型信息" do
      attributes_table_for vehicletype do
        row("类型名称") {v.name}
        row("载货量") {v.capacity}
        row("综合油耗") {v.fuel}
        row("保养周期") {v.maintcycle}
      end
    end
  end
end
