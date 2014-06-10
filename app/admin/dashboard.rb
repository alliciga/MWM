require "historyrecord.rb"

ActiveAdmin.register_page "Dashboard" do

  menu :label => "实时清运统计", :priority => 1

  year = Time.now.strftime("%Y").to_i
  month = Time.now.strftime("%m").to_i
  day = Time.now.strftime("%d").to_i

  #累计清运时间
  timesum = 0.0

  #本月清运有效记录
  c1 = HistoryRecord.where(["starttime>? and endtime<? and endtime>starttime",Time.mktime(year,month)+28800,Time.mktime(year,month+1)+28800])
  #清运时间计算
  c1.find_each do |r|
    timesum = timesum + (r.endtime-r.starttime)
  end

  content :title => "医废处置实时清运统计" do
    panel "清运工作统计" do
      h3 "本单位目前共承担" + Organization.count.to_s + "个医疗机构的清运工作，拥有清运车" + Vehicle.count.to_s + "辆，清运工" + Worker.count.to_s + "名"
      h3 year.to_s + "年" + month.to_s + "月累计清运" + c1.count.to_s + "车*次，累计清运时间" + (timesum/60).to_i.to_s + "分钟。"
    end

    columns do
      column :span=>2 do
        render "missing_organizations_alert"
      end
      column :span=>3 do
        render :partial=>'single_vehicle', :locals=>{:m=>month}
      end
    end
  end #content

  sidebar "车辆筛选", :partial=>"single_vehicle_sidebar"
end #page
