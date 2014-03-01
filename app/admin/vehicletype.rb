ActiveAdmin.register Vehicletype do
  menu :label => "类型", :parent => "清运车辆", :priority => 7

  index do
    column "类型名称",:name
    column "载货量（吨）",:capacity
    column "综合油耗",:fuel
    column "维检周期",:maintcycle
    default_actions
  end
end
