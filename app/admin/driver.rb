ActiveAdmin.register Driver do
  menu :label => "司机", :parent => "人员", :priority => 6

  index :title => "司机资料"  do
    column "姓名",:name
    column "身份证号",:certid
    column "电话",:phone
    column "上次体检日期",:lastcheckdate
    default_actions
  end

  filter :lastcheckdate, :label=>"上次体检日期"

end
