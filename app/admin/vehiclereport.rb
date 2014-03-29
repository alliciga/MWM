require "historyrecord.rb"

ActiveAdmin.register_page "VehicleReport" do
  menu :label => "车辆清运", :parent => "月统计报表", :priority => 2

  year = Time.now.strftime("%Y").to_i
  month = Time.now.strftime("%m").to_i
  c1 = HistoryRecord.where(["starttime>? and endtime<? and endtime>starttime",Time.mktime(year,month),Time.mktime(year,month+1)])

  content :title => '车辆清运统计报表' do
    div :class => "blank_slate_container" do
      span :class => "blank_slate" do
        span "总体合规运营率，月总行驶里程数，清运车当月绩效评分排名"
        h2 "现在是 " + year.to_s + " 年 " + month.to_s + " 月"
        h2 "目前共承担 " + Organization.count.to_s + " 个医疗机构的医废清运工作"
        h2 "本月累计清运 " + c1.count.to_s + " 车*次"
      end
    end

    div :class => "blank_slate_container" do
      span :class => "blank_slate" do
        Vehicle.find_each do |v|
          record1 = c1.where(["vehiclenum=?",v.name])
          h4 record1.first.vehiclenum
          table_for record1 do
            column "车牌号码",:vehiclenum
            column "医疗机构名称",:yljgname
            column "清运时间",:starttime
          end
        end
      end
    end
  end
end
