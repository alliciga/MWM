require "historyrecord.rb"

ActiveAdmin.register_page "Dashboard" do

  menu :label => "压缩式清运车实时清运统计", :priority => 1

  year = Time.now.strftime("%Y").to_i
  month = Time.now.strftime("%m").to_i
  day = Time.now.strftime("%d").to_i

  #累计清运时间
  timesum = 0.0

  #本月清运有效记录
  if month == 12 then
  c1 = HistoryRecord.where(["starttime>? and endtime<? and endtime>starttime",Time.mktime(year,month)+28800,Time.mktime(year+1,1)+28800])
  else
  c1 = HistoryRecord.where(["starttime>? and endtime<? and endtime>starttime",Time.mktime(year,month)+28800,Time.mktime(year,month+1)+28800])
  end

  #清运时间计算
  c1.find_each do |r|
    timesum = timesum + (r.endtime-r.starttime)
  end

  content :title => "压缩式清运车清运统计" do

    columns do
      column :span=>2 do
        render "missing_organizations_alert"
      end
      column :span=>3 do
        render :partial=>'single_vehicle'
      end
    end
  end #content

  sidebar "压缩式清运车筛选统计", :partial=>"single_vehicle_sidebar"
end #page
