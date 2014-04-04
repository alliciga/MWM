require "historyrecord.rb"

ActiveAdmin.register_page "VehicleReport" do
  menu :label => "车辆清运", :parent => "统计报表", :priority => 3

  year = Time.now.strftime("%Y").to_i
  month = Time.now.strftime("%m").to_i

  #累计清运时间
  timesum = 0.0 

  #本月清运有效记录
  c1 = HistoryRecord.where(["starttime>? and endtime<? and endtime>starttime",Time.mktime(year,month)+28800,Time.mktime(year,month+1)+28800])
  #清运时间计算
  c1.find_each do |r|
    timesum = timesum + (r.endtime-r.starttime)
  end

  content :title => '车辆清运统计报表' do
    panel "清运工作统计" do
        h2 "本单位目前拥有清运车 " + Vehicle.count.to_s + " 辆。"
        h2 year.to_s + " 年 " + month.to_s + " 月累计完成清运 " + c1.count.to_s + " 车•次，累计清运时间 " + (timesum/60).to_i.to_s + " 分钟。"
    end

    columns do
      column :span=>1 do
        span "按照清运车次排序"
      end
      column :span=>2 do
        render "single_vehicle"
      end
    end

  end

  sidebar "车辆筛选", :partial=>"single_vehicle_sidebar"

end
