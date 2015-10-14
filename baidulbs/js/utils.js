//File name: utils.js
//获得百度LBS服务器端数据

//全局变量定义
var LBSData =[];
var VehicleData = [];

//重新从服务器装载数据
//计算车辆数据，更新全局变量
function reloadVehicleData() {
	// 遍历数据，提取清运车列表及负责医院数量
	var found = false;
	$.each(LBSData, function(i, lbsItem) {
		//车辆列表为空，直接添加第一个车辆，清运机构数量为1
		if(VehicleData.length == 0) {
			VehicleData = VehicleData.concat(eval("([{vehicle:'" + lbsItem.vehicle + "',count:1}])"));
		} else {
			//遍历车辆列表
			$.each(VehicleData, function (j, vehicleItem) {
				//找到匹配车辆牌号
				if(lbsItem.vehicle == vehicleItem.vehicle) {
					vehicleItem.count++;	//清运机构数加1
					found = true; 			//设置已匹配标志
				}
			});
			//未匹配成功，增加一条车辆数据
			if(found == false) {
				VehicleData = VehicleData.concat(eval("([{vehicle:'" + lbsItem.vehicle + "',count:1}])"));
			}
			found = false;	//重置匹配标志
			//已匹配，进入下一条数据
		}
	});
	//重写车辆列表
	$("#VehicleList").html("");
	if(VehicleData.length>0) {
		$.each(VehicleData, function(i, vehicleItem) {
			$("#VehicleList").append("<p><a href=\"#\" id="
					+ vehicleItem.vehicle + ">   " + vehicleItem.vehicle + " : " 
					+ vehicleItem.count + "</a></p>");
		})
	}
}


// 获得当前完整医疗机构数据列表，数据位JSON结构
function getHospitals() {
	var url = "http://api.map.baidu.com/geodata/v3/poi/list?callback=?";
	// 定义变量，
    var hospitals = hospital_index = [],
    hospital_count = hospital_count_max = 0,
    page = 0, page_size = 50,
    firsttime = true;

    // 显示加载动画
    loading.baosight.showPageLoadingMsg();
    
	// 首次执行
	$.ajax({
		url : url,
		headers : {
			'Access-Control-Allow-Origin' : '*'
		},
		crossDomain : true,
		data : {
			'geotable_id' : 92292,
			'ak' : 'AHlXvdQ2AcfSy3KAixNEOfOx',
			'page_index' : page,
			'page_size' : page_size,
		},
		success : function(json) {
			if (json.status != 0)
				return false; // 失败
			if (json.pois == null)
				return false; // 无数据

			hospitals = json.pois;
			hospital_count = json.size;
			hospital_count_max = json.total;

			// 如果未取完数据，继续取数
			if (hospital_count_max > hospital_count) {
				var j = parseInt(hospital_count_max / page_size);
				var h = hospital_count_max / page_size;
				if (h - j == 0)
					m = j - 1;
				else
					m = j;
				for (var i = 1; i < m + 1; i++) {
					page = i;
					// 非首次执行，继续取数据
					$.ajax({
						url : url,
						headers : {
							'Access-Control-Allow-Origin' : '*'
						},
						crossDomain : true,
						data : {
							'geotable_id' : 92292,
							'ak' : 'AHlXvdQ2AcfSy3KAixNEOfOx',
							'page_index' : page,
							'page_size' : page_size,
						},
						success : function(json) {
							if (json.status != 0)
								return false; // 失败
							hospital_count = hospital_count + json.size;
							hospital_count_max = json.total;
							hospitals = hospitals.concat(json.pois);
							//取得所有数据
							if(hospitals.length == hospital_count_max) {
								LBSData = hospitals;
								//结束加载动画
								loading.baosight.hidePageLoadingMsg();
								//数据后处理
								reloadVehicleData();
								//renderMap();
								//结束加载数据及处理过程
								return;
							}
						},
						error : function() {
							alert('ajax error')
							//结束加载动画
							loading.baosight.hidePageLoadingMsg();
						},
						dataType : 'json',
						async : false
					});
				}
			} else { // 数据已取完
				//不会运行至此处。
			}
		},
		error : function() {
			alert('ajax error')
			//结束加载动画
			loading.baosight.hidePageLoadingMsg();
		},
		dataType : 'json',
		async : false
	});
}

// 计算统计数据
function Analysis(HospitalData) {
	// Ruby 生成的页面将数据保存在页面变量中，等待此处做合并处理
	// 将 Ruby 生成的“未清运”数据与 Baidu 获取的“未清运”数据做“与”运算
	// 即两者同时符合“未清运”条件的才判定为“未清运”
	return;
}



// 渲染页面，根据结果替换页面中已有数据
function RenderPage() {
	return;
}

var loading = {
        baosight : {
            showPageLoadingMsg : function(){
                document.getElementById('fade').style.display='block';
                document.getElementById('_loading_div').style.display='block';
                document.getElementById('_loadMsg').style.display='block';
            },
            hidePageLoadingMsg :function() {
            	document.getElementById('fade').style.display='none';
                document.getElementById('_loading_div').style.display='none';
                document.getElementById('_loadMsg').style.display='none';
            }
        }
}