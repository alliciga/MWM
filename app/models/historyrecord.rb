class HistoryRecord < ActiveRecord::Base
  self.table_name = "historyrecord"
  #self.primary_key = "yljgid,vehiclenum,starttime"
  attr_accessible :vehiclenum, :yljgname,:starttime,:endtime
end
