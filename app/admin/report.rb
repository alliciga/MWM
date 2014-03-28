require "historyrecord.rb"

ActiveAdmin.register_page "Report" do
  menu :label => "统计报表", :priority => 2

  content :title => '医废清运统计报表' do
    div :class => "blank_slate_container" do
      span :class => "blank_slate" do
        span "承担医废清运医疗机构总数，总体合规运营率，月总清运次数，月总行驶里程数，清运车当月绩效评分排名"
      end
    end

    div :class => "blank_slate_container" do
      span :class => "blank_slate" do
        span "月焚烧垃圾总量，当月设备故障停机时间，当月绩效评分排名"
      end
    end

    h1 "清运次数" + HistoryRecord.where(["vehiclenum='晋A59661'"]).count.to_s
    table_for HistoryRecord.where(["vehiclenum='晋A59661'"]) do
      column "skjdf",:vehiclenum
      column "医疗机构名称",:yljgname

#      if (r1.endtime-r1.starttime)>90.0
#        li r1.vehiclenum + " , " + r1.yljgname + " , " + r1.starttime.to_s + " , 停留时间：" + ((r1.endtime - r1.starttime)/60.0).round(1).to_s + " 分钟."
#      end
    end
  end

  sidebar '车辆清运统计明细' do
    ul do
      li '晋A59661'
      li '晋AJ4606'
      li '晋AH9614'
      li '晋A44460'
      li '晋A72078'
      li '晋A89711'
      li '晋A72234'
      li '晋A39321'
      li '晋A98258'
    end
  end

  sidebar '医疗机构清运统计明细' do
    para '搜索框'
  end
end
