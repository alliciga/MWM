require "historyrecord.rb"

ActiveAdmin.register_page "OrganizationReport" do
  menu :label => "医疗机构", :parent => "月统计报表", :priority => 2

  year = Time.now.strftime("%Y").to_i
  month = Time.now.strftime("%m").to_i
  c1 = HistoryRecord.where(["starttime>? and endtime<? and endtime>starttime",Time.mktime(year,month),Time.mktime(year,month+1)])

  content :title => '医疗机构清运统计报表' do
    div :class => "blank_slate_container" do
      span :class => "blank_slate" do
        h2 year.to_s + " 年 " + month.to_s + " 月"
        h2 "目前共承担 " + Organization.count.to_s + " 个医疗机构的医废清运工作"
        h2 "本月实际完成 " + c1.group("yljgname").count.count.to_s + " 个医疗机构的医废清运工作"
      end
    end

    div :class => "blank_slate_container" do
      span :class => "blank_slate" do
        Organization.find_each do |o|
          record1 = c1.where(["yljgname=?",o.name])
          if record1.first then
            h4 record1.first.yljgname
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

  sidebar '医疗机构清运统计明细' do
    para '搜索框'
  end
end
