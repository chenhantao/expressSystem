//****************针对第一种方式的具体js实现部分******************//
//****************所使用的数据是city.js******************//

/*根据id获取对象*/
function $(str) {
  return document.getElementById(str);
}

var addrShow = $('addr-show');
var addrShow2=$('addr-show2');
//console.log("Yes!");
var s_province = $('s_province');
var s_city = $('s_city');
var s_area = $('s_area');

var r_province =$('r_province');
var r_city =$('r_city');
var r_area=$('r_area');

/*用于保存当前所选的省市区*/
var current = {
  province: '',
  city: '',
  area: ''
};

var current2={
	province:'',
	city:'',
	area:''
};
/*自动加载省份列表*/
(function showProv() {
 
  var len = provice.length;
  for (var i = 0; i < len; i++) {
      var provOpt = document.createElement('option');
	  var provOpt02 =document.createElement('option');
      provOpt.innerText = provice[i]['name'];
      provOpt.value = i;
	  
	  provOpt02.innerText = provice[i]['name'];
	  provOpt02.value=i;
      s_province.appendChild(provOpt);
	  r_province.appendChild(provOpt02);
  }
})();

/*根据所选的省份来显示城市列表*/
function showSProvince(obj) {
  var val = obj.options[obj.selectedIndex].value;
  if (val != current.province) {
      current.province = val;
      addrShow.value = '';
      
  }
  //console.log(val);
  if (val != null) {
      s_city.length = 1;
      var cityLen = provice[val]["city"].length;
      for (var j = 0; j < cityLen; j++) {
          var cityOpt = document.createElement('option');
          cityOpt.innerText = provice[val]["city"][j].name;
          cityOpt.value = j;
          s_city.appendChild(cityOpt);
      }
  }
}
function showRProvince(obj) {
	  var val2 = obj.options[obj.selectedIndex].value;
	  if (val2 != current2.province) {
	      current2.province = val2;
	      addrShow2.value = '';     
	  }
	  //console.log(val);
	  if (val2 != null) {
	      r_city.length = 1;
	      var cityLen2 = provice[val2]["city"].length;
	      for (var j = 0; j < cityLen2; j++) {
	          var cityOpt2 = document.createElement('option');
	          cityOpt2.innerText = provice[val2]["city"][j].name;
	          cityOpt2.value = j;
	          r_city.appendChild(cityOpt2);
	      }
	  }
	}

/*根据所选的城市来显示县区列表*/
function showSCity(obj) {
  var val = obj.options[obj.selectedIndex].value;
  current.city = val;
  if (val != null) {
      s_area.length = 1; //清空之前的内容只留第一个默认选项
      var countryLen = provice[current.province]["city"][val].districtAndCounty.length;
      if(countryLen == 0){
          addrShow.value = provice[current.province].name + '-' + provice[current.province]["city"][current.city].name;
          return;
      }
      for (var n = 0; n < countryLen; n++) {
          var countryOpt = document.createElement('option');
          countryOpt.innerText = provice[current.province]["city"][val].districtAndCounty[n];
          countryOpt.value = n;
          s_area.appendChild(countryOpt);
      }
  }
}
function showRCity(obj) {
	  var val = obj.options[obj.selectedIndex].value;
	  current2.city = val;
	  if (val != null) {
	      r_area.length = 1; //清空之前的内容只留第一个默认选项
	      var countryLen = provice[current2.province]['city'][val].districtAndCounty.length;
	      if(countryLen == 0){
	          addrShow2.value = provice[current2.province].name + '-' + provice[current2.province]['city'][current2.city].name;
	          return;
	      }
		  //s_area.removeChild(s_area.firstChild);
	      for (var n = 0; n < countryLen; n++) {
	          var countryOpt = document.createElement('option');
	          countryOpt.innerText = provice[current2.province]['city'][val].districtAndCounty[n];
	          countryOpt.value = n;
	          r_area.appendChild(countryOpt);
	      }
	  }
	}
/*选择县区之后的处理函数*/
function showSArea(obj) {
  current.area = obj.options[obj.selectedIndex].value;
  addrShow.value = provice[current.province].name + '-' + provice[current.province]["city"][current.city].name + '-' + provice[current.province]["city"][current.city].districtAndCounty[current.area] + '-';

}

function showRArea(obj) {
	current2.area = obj.options[obj.selectedIndex].value;
    addrShow2.value = provice[current2.province].name + '-' + provice[current2.province]["city"][current2.city].name + '-' + provice[current2.province]["city"][current2.city].districtAndCounty[current2.area] + '-';
}

function showAddr() {
    addrShow.value = provice[current.province].name + '-' + provice[current.province]["city"][current.city].name + '-' + provice[current.province]["city"][current.city].districtAndCounty[current.area] + '-';
    addrShow2.value = provice[current2.province].name + '-' + provice[current2.province]["city"][current2.city].name + '-' + provice[current2.province]["city"][current2.city].districtAndCounty[current2.area] + '-';
}