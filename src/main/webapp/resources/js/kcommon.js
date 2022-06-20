 var lang_kor = {
            "decimal" : "",
            "emptyTable" : "데이터가 없습니다.",
            "info" : "_START_ - _END_ (총 _TOTAL_ 명)",
            "infoEmpty" : "0명",
            "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
            "infoPostFix" : "",
            "thousands" : ",",
            "lengthMenu" : "_MENU_ 개씩 보기",
            "loadingRecords" : "로딩중...",
            "processing" : "처리중...",
            "search" : "  검색 : ",
            "zeroRecords" : "검색된 데이터가 없습니다.",
            "paginate" : {
                "first" : "첫 페이지",
                "last" : "마지막 페이지",
                "next" : "다음",
                "previous" : "이전"
            },
            "aria" : {
                "sortAscending" : " :  오름차순 정렬",
                "sortDescending" : " :  내림차순 정렬"
            }
        };
 function between(target,a, b) {
	  var min = Math.min.apply(Math, [a, b]),
	    max = Math.max.apply(Math, [a, b]);
	  return target > min  && target < max;
}
 function ismembercheck(){
	 	alert("회원만이 이용가능한 기능입니다.");
		location.href = "/login";
}
 function logKey(item){
 	return item.target_user_seq+"_"+item.user_seq+"_"+new Date(item.log_create_date).format("yyyyMMdd");
 }
 function getStar(seq,score, item , clickable,margin){
 	var star = "";
 	var margin_d = checknull(margin,"10px");
 	if(clickable){
 		star += '<img onclick="clickStar(1,`'+seq+'`,'+item.target_user_seq+','+item.user_seq+','+item.log_create_date+')" src="'+(score >= 1 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;" id="star_id_1_'+seq+'" class="fa fa-star star_'+seq+'">';
 		star += '<img onclick="clickStar(2,`'+seq+'`,'+item.target_user_seq+','+item.user_seq+','+item.log_create_date+')" src="'+(score >= 2 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;" id="star_id_2_'+seq+'" class="fa fa-star star_'+seq+'">';
    	star += '<img onclick="clickStar(3,`'+seq+'`,'+item.target_user_seq+','+item.user_seq+','+item.log_create_date+')" src="'+(score >= 3 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;" id="star_id_3_'+seq+'" class="fa fa-star star_'+seq+'">';
    	star += '<img onclick="clickStar(4,`'+seq+'`,'+item.target_user_seq+','+item.user_seq+','+item.log_create_date+')" src="'+(score >= 4 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;" id="star_id_4_'+seq+'" class="fa fa-star star_'+seq+'">';
    	star += '<img onclick="clickStar(5,`'+seq+'`,'+item.target_user_seq+','+item.user_seq+','+item.log_create_date+')" src="'+(score >= 5 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;" id="star_id_5_'+seq+'" class="fa fa-star star_'+seq+'">';
 	}else{
 		star += '<img src="'+(score >= 1 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;" id="star_id_1_'+seq+'" class="fa fa-star star_'+seq+'">';
 		star += '<img src="'+(score >= 2 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;" id="star_id_2_'+seq+'" class="fa fa-star star_'+seq+'">';
 		star += '<img src="'+(score >= 3 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;" id="star_id_3_'+seq+'" class="fa fa-star star_'+seq+'">';
 		star += '<img src="'+(score >= 4 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;" id="star_id_4_'+seq+'" class="fa fa-star star_'+seq+'">';
 		star += '<img src="'+(score >= 5 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;" id="star_id_5_'+seq+'" class="fa fa-star star_'+seq+'">';
 	}
 	return star;
 }
 
var non_app_color = "#FF996E !important";
var app_color = "#1ab394 !important";
var app_color1 = "#1AFF94  !important";
var app_color2 = "#1AFF94  !important";
var app_color3 = "#1AFF94  !important";
var calendar_text_color = "#FFFFFF !important";
var calendar_text_color_Feb = "#000000 !important";
function findid(id,func){
	$.ajax({
		type : 'POST',
		dataType : "json",
		data : {
			userId: id
		},
		async : false,
		url : '/user/findId',
		success : function(res) {
			if(res.success){
				func(res.rows);
			}else
			{
				//func(res.rows);
			}
		},
		error:function(request,status,error){}
	});
}
function setCookie(cookieName, value, exdays){
	   var exdate = new Date();
	   exdate.setDate(exdate.getDate() + exdays);
	   var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	   document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName){
	   var expireDate = new Date();
	   expireDate.setDate(expireDate.getDate() - 1);
	   document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}

	function getCookie(cookieName) {
	   cookieName = cookieName + '=';
	   var cookieData = document.cookie;
	   var start = cookieData.indexOf(cookieName);
	   var cookieValue = '';
	   if(start != -1){
	      start += cookieName.length;
	      var end = cookieData.indexOf(';', start);
	      if(end == -1)end = cookieData.length;
	      cookieValue = cookieData.substring(start, end);
	   }
	   return unescape(cookieValue);
	}

function checknull(value,returndata){
	   if(value == undefined || value == ""){
		   if(returndata != null) return returndata;
		   return "";
	   }else{
		   return value;
	   }
}

function setPhoneNumber(id){
	 var number = $("#"+id).val().replace(/[^0-9]/g,'');
	 var tmp = "";
	 if(number.length < 4){
		 return $("#"+id).val(number);
	 }else if(number.length < 7){
		 tmp += number.substr(0,3);
		 tmp += '-';
		 tmp += number.substr(3);
		 return $("#"+id).val(tmp);
	 }else if(number.length < 11){
		 tmp += number.substr(0,3);
		 tmp += '-';
		 tmp += number.substr(3,3);
		 tmp += '-';
		 tmp += number.substr(6);
		 return $("#"+id).val(tmp);
	 }else{
		 tmp += number.substr(0,3);
		 tmp += '-';
		 tmp += number.substr(3,4);
		 tmp += '-';
		 tmp += number.substr(7);
		 return $("#"+id).val(tmp);
	 }
	 return $("#"+id).val(number); 
}
function validateReg(reg){
	var re = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
	return re.test(reg);
}
function validateEmail(email) {
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return re.test(email);
	}
function numberWithCommas(x,type) {
	if(x == undefined || x == null){
		return "0";
	}
	if(type == undefined || type == null){
		type = true;
	}
	if(parseInt(x) > 99999999 && type){
		x = (Math.round((parseInt(x) / 100000000)*10)/10).toString();
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") +" 억";
	}
	if(parseInt(x) > 9999 && type){
		x = (Math.round((parseInt(x) / 10000)*10)/10).toString();
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") +" 만";
	}
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function numberWithCommastext(obj , type) {
	if(type){
		obj.value =  numberWithCommas(obj.value , true);
	}else{
		obj.value =  comma(uncomma(obj.value));
	}
	  
}

function comma(str) { 
    str = String(str); 
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); 
} 

function uncomma(str) { 
    str = String(str); 
    return str.replace(/[^\d]+/g, ''); 
}


Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};


 
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};

function getBase64(file,func) {
	   var reader = new FileReader();
	   reader.readAsDataURL(file);
	   reader.onload = function () {
		   if(func == null) return;
		   func(reader.result);
	     console.log(reader.result);
	   };
	   reader.onerror = function (error) {
	     console.log('Error: ', error);
	   };
	}
 
function getCodeSelectList(value,selectid,all,func,allname){
	$.ajax({
		type : 'POST',
		dataType : "json",
		data : {
			type: value
		},
		async : false,
		url : '/getCodeList',
		success : function(res) {
			if(res.success){
				var dumpstr = '<option value="00">'+(checknull(allname) == "" ? "전체" : allname)+'</option>';
				if(!all){
					dumpstr = "";
				}
				
				for(var i = 0 ; i < res.rows.length; i++){
						dumpstr += '<option value="'+res.rows[i]["code"]+'">'+res.rows[i]["code_name"]+'</option>';
				}
				
				$("#"+selectid).append(dumpstr);
				if(func != null){
					func(selectid);
				}
			}
		},
		error:function(request,status,error){}
	});
}

function getCodeSelectValue(value,target,dataarray,fn){
	$.ajax({
		type : 'POST',
		dataType : "json",
		data : {
			type: value
		},
		async : false,
		url : '/getCodeList',
		success : function(res) {
			if(res.success){
				var dumpstr = "";
				for(var i = 0 ; i < dataarray.length ; i++){
					for(var j = 0 ; j < res.rows.length; j++){
						if(dataarray[i] == res.rows[j]["code"]){
							if(dumpstr == ""){
								dumpstr = res.rows[j]["code_name"];
							}else{
								dumpstr += ","+res.rows[j]["code_name"];
							}
							break;
						}
					}
					
				}
				
				
				$("#"+target).text(dumpstr);
				if(fn != null){
					fn();
				}
				
			}
		},
		error:function(request,status,error){}
	});
}

function setCodeData(value,setid,data){
	if(checknull(data) == ""){
		return "";
	}
	$.ajax({
		type : 'POST',
		dataType : "json",
		data : {
			type: value
		},
		async : false,
		url : '/getCodeList',
		success : function(res) {
			if(res.success){
				var dumpstr = "";
				var dump = data.split(",");
				for(var p = 0 ; p < dump.length; p++){
					for(var i = 0 ; i < res.rows.length; i++){
						if(dump[p] == res.rows[i]["code"]){
							dumpstr += (dumpstr == "" ? "" : ",")+res.rows[i]["code_name"];
						}
					}
				}
			
				$("#"+setid).text(dumpstr);
				$("#"+setid).val(dumpstr);
			}
		},
		error:function(request,status,error){}
	});
	return "";
}

function getCodeCheckBox(value,comboid,read,func){
	$.ajax({
		type : 'POST',
		dataType : "json",
		data : {
			type: value
		},
		async : false,
		url : '/getCodeList',
		success : function(res) {
			if(res.success){
				var	dumpstr = "";
				
				for(var i = 0 ; i < res.rows.length; i++){
					if(read == null || read == false){
						dumpstr += '<label class="i-checks"> <input type="checkbox" name="'+comboid+'_name" value="'+res.rows[i]["code"]+'" id="'+comboid+'_check_'+i+'"> '+res.rows[i]["code_name"]+' </label>';
					}else{
						dumpstr += '<label class="i-checks"> <input type="checkbox" name="'+comboid+'_name" value="'+res.rows[i]["code"]+'" id="'+comboid+'_check_'+i+'" disabled> '+res.rows[i]["code_name"]+' </label>';
					}
				}
				
				$("#"+comboid).append(dumpstr);
				if(func != null){
					func(comboid);
				}
			}
		},
		error:function(request,status,error){}
	});
}
function setCodeOutLineButton(nameid,dataarray){
	for(var p2 = 0 ; p2 < dataarray.length; p2++){
		for(var i = 0 ; i < $("button[name="+nameid+"_name]").length; i++){
			if($("#"+$("button[name="+nameid+"_name]")[i].id).attr("data-code") == dataarray[p2]){
				CodeOutLineButtonChange($("button[name="+nameid+"_name]")[i],true);
				break;
			}
		}
	}
}

function selectedCodeOutLineRadioButton(id,type){
	for(var i = 0 ; i < $("button[name="+id+"_name]").length; i++){
		if($("#"+$("button[name="+id+"_name]")[i].id).attr("data-value") == "1"){
			if(type == null){
				return $("#"+$("button[name="+id+"_name]")[i].id).attr("data-code");
			}else{
				return $("#"+$("button[name="+id+"_name]")[i].id).text();
			}
			
		}
	}
	return "";
}
function getCodeOutLineRadioButton(value,buttonid,func,width,height,data,code){
	
	var dumpstyle ='style="';
	dumpstyle += 'margin-left:5px;word-wrap: break-word;white-space:normal !important;';
	if(width != null){
		dumpstyle += 'width:'+width+'px;';
	}
	if(height != null){
		dumpstyle += 'height:'+height+'px;';
	}
	dumpstyle += '"';
	
	if(data == null){
		$.ajax({
			type : 'POST',
			dataType : "json",
			data : {
				type: value
			},
			async : false,
			url : '/getCodeList',
			success : function(res) {
				if(res.success){
					var	dumpstr = "";
					var clickevent = "";
					for(var i = 0 ; i < res.rows.length; i++){
					
							dumpstr += '<button type="button" '+dumpstyle+' class="btn btn-outline btn-default" onclick="CodeOutLineRadioButtonClickEventHandler(this)" name="'+buttonid+'_name" data-tname="'+buttonid+'" data-value="0" data-code="'+res.rows[i]["code"]+'" id="'+buttonid+'_button_'+i+'">'+res.rows[i]["code_name"]+'</button>';
						//	dumpstr += '<label class="i-checks"> <input type="checkbox" name="'+comboid+'_name" value="'+res.rows[i]["code"]+'" id="'+comboid+'_check_'+i+'"> '+res.rows[i]["code_name"]+' </label>';
					}
					
					$("#"+buttonid).html(dumpstr).trigger("create");
					if(func != null){
						func();
					}
				}
			},
			error:function(request,status,error){}
		});
	}else{
		var	dumpstr = "";
		for(var i = 0; i < data.length; i++){
			if(i == 0){
				dumpstr += '<button type="button" '+dumpstyle+' class="btn btn-outline btn-warning" onclick="CodeOutLineRadioButtonClickEventHandler(this)" name="'+buttonid+'_name" data-value="1" data-tname="'+buttonid+'" data-code="'+code[i]+'" id="'+buttonid+'_button_'+i+'">'+data[i]+'</button>';
			}else{
				dumpstr += '<button type="button" '+dumpstyle+' class="btn btn-outline btn-default" onclick="CodeOutLineRadioButtonClickEventHandler(this)" name="'+buttonid+'_name" data-value="0" data-tname="'+buttonid+'" data-code="'+code[i]+'" id="'+buttonid+'_button_'+i+'">'+data[i]+'</button>';	
			}
			
		}
		$("#"+buttonid).html(dumpstr).trigger("create");
		if(func != null){
			func();
		}
	
	}
	
	
	
}


function CodeOutLineRadioButtonClickEventHandler(target){
	var name =  $("#"+target.id).attr("data-tname")+"_name";
	for(var i = 0 ; i < $("button[name="+name+"]").length; i++){
		if($("#"+$("button[name="+name+"]")[i].id).attr("data-code") == $("#"+target.id).attr("data-code")){
			$("#"+$("button[name="+name+"]")[i].id).attr("data-value","1");
			$("#"+$("button[name="+name+"]")[i].id).removeClass("btn-default");
			$("#"+$("button[name="+name+"]")[i].id).addClass("btn-warning");
		}else{
			$("#"+$("button[name="+name+"]")[i].id).attr("data-value","0");
			$("#"+$("button[name="+name+"]")[i].id).removeClass("btn-warning");
			$("#"+$("button[name="+name+"]")[i].id).addClass("btn-default");
		}
	}
}




function getCodeOutLineButton(value,buttonid,func,width,height,data,code,disable){
	
	var dumpstyle ='style="';
	dumpstyle += 'margin-left:5px;word-wrap: break-word;white-space:normal !important;';
	if(width != null){
		dumpstyle += 'width:'+width+';';
	}
	if(height != null){
		dumpstyle += 'height:'+height+';';
	}
	dumpstyle += 'font-size:12px;'
	dumpstyle += '"';
	
	if(data == null){
		$.ajax({
			type : 'POST',
			dataType : "json",
			data : {
				type: value
			},
			async : false,
			url : '/getCodeList',
			success : function(res) {
				if(res.success){
					var	dumpstr = "";
					var clickevent = "";
					for(var i = 0 ; i < res.rows.length; i++){
						dumpstr += '<div class="col-md-3 col-4 pe-1 ps-1 mb-2">';
					    dumpstr += '<input type="checkbox" class="btn-check valid" name="'+buttonid+'_name" data-code="'+res.rows[i]["code"]+'" id="'+buttonid+'_button_'+res.rows[i]["code"]+'">';
					    dumpstr += '<label class="btn btn-outline-primary nott ls0 w-100" for="'+buttonid+'_button_'+res.rows[i]["code"]+'">'+res.rows[i]["code_name"]+'</label>';
					    dumpstr += '</div>';
						//	dumpstr += '<label class="i-checks"> <input type="checkbox" name="'+comboid+'_name" value="'+res.rows[i]["code"]+'" id="'+comboid+'_check_'+i+'"> '+res.rows[i]["code_name"]+' </label>';
					}
				//	$("#"+buttonid).css("margin-left","-4px");
					$("#"+buttonid).html(dumpstr).trigger("create");
					if(func != null){
						func();
					}
				}
			},
			error:function(request,status,error){}
		});
	}else{
		var	dumpstr = "";
		for(var i = 0; i < data.length; i++){
			dumpstr += '<button type="button" '+dumpstyle+' class="btn btn-outline btn-default" onclick="CodeOutLineButtonClickEventHandler(this)" name="'+buttonid+'_name" data-value="0" data-code="'+code[i]+'" id="'+buttonid+'_button_'+i+'">'+data[i]+'</button>';
		}
		
		$("#"+buttonid).css("margin-left","-4px");
		$("#"+buttonid).html(dumpstr).trigger("create");
		if(func != null){
			func();
		}
	}
	
	
	
}

function CodeOutLineButtonClickEventHandler(target){
	
	if($("#"+target.id).attr("data-value") == "0"){
		$("#"+target.id).attr("data-value","1");
		$("#"+target.id).removeClass("btn-default");
		$("#"+target.id).addClass("btn-warning");
	}else{
		$("#"+target.id).attr("data-value","0");
		$("#"+target.id).removeClass("btn-warning");
		$("#"+target.id).addClass("btn-default");
	}
	
}

function CodeOutLineButtonChange(target , value){
	if(value){
		$("#"+target.id).attr("data-value","1");
		$("#"+target.id).removeClass("btn-default");
		$("#"+target.id).addClass("btn-warning");
	}else{
		$("#"+target.id).attr("data-value","0");
		$("#"+target.id).removeClass("btn-warning");
		$("#"+target.id).addClass("btn-default");
	}
}

function getTimeBox(targetid,type,gap){
	if(type == "hh"){
		var dumpstr = "";
		for(var i = 0 ; i < 24 ; i++){
			dumpstr += '<option value="'+(i < 10 ? "0"+i : i )+'">'+(i < 10 ? "0"+i : i )+'</option>';
		}
		
		$("#"+targetid).append(dumpstr);
	}else if(type == "mi"){
		var dumpstr = "";
		var gp = (60/gap);
		for(var i = 0 ; i < gp ; i++ ){
			dumpstr += '<option value="'+((i*gap) < 10 ? "0"+(i*gap) : (i*gap) )+'">'+((i*gap) < 10 ? "0"+(i*gap) : (i*gap) )+'</option>';
		}
		$("#"+targetid).append(dumpstr);
	}
}

function selectSearchIndex(val , id){
	//var obj = $('#'+id+' option');
	
	$('#'+id+' option').each(function()
	{
		if( $(this).val() == val){
			    $(this).prop('selected', true);
		}
	});
	
}	

// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
function initLayerPosition(value){
    var width = 600; //우편번호서비스가 들어갈 element의 width
    var height = 500; //우편번호서비스가 들어갈 element의 height
    var borderWidth = 5; //샘플에서 사용하는 border의 두께
    value.style.display = 'block';
    // 위에서 선언한 값들을 실제 element에 넣는다.
    value.style.width = width + 'px';
    value.style.height = height + 'px';
    value.style.border = borderWidth + 'px solid';
    // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
    value.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
    value.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}


function getCodeList(value,refun){
	$.ajax({
		type : 'POST',
		dataType : "json",
		data : {
			type: value
		},
		async : false,
		url : '/getCodeList',
		success : function(res) {
			if(res.success){
				refun(res.rows);
			}
		},
		error:function(request,status,error){}
	});
}

function Kajax(url , data  , resultFn , faltFn , loading){
	if(loading)$('body').loading("start");
	$.ajax({
		type : 'POST',
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		data : data,
		async : false,
		url : url,
		success : function(res) {
			if(loading)$('body').loading("stop");
			if(resultFn != null)resultFn(res);
		},
		error:function(request,status,error){
			if(loading)$('body').loading("stop");
			if(faltFn != null)faltfn(request,status,error);
		}
	});
}
function isNumberKey(evt) {

    var charCode = (evt.which) ? evt.which : event.keyCode;

    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))

        return false;



    // Textbox value       

    var _value = event.srcElement.value;       

    _value = _value.replace(/,/g, '');

    // 소수점(.)이 두번 이상 나오지 못하게

    var _pattern0 = /^\d*[.]\d*$/; // 현재 value값에 소수점(.) 이 있으면 . 입력불가

    if (_pattern0.test(_value)) {

        if (charCode == 46) {

            return false;

        }

    }



    // 1000 이하의 숫자만 입력가능

    var _pattern1 = /^\d{30}$/; // 현재 value값이 3자리 숫자이면 . 만 입력가능

    if (_pattern1.test(_value)) {

        if (charCode != 46) {

            alert("1000 이하의 숫자만 입력가능합니다");

            return false;

        }

    }



    // 소수점 둘째자리까지만 입력가능


    return true;

}

function createtasknumber(){
	return new Date().format("yyyyMMddHHmm");
}



function numkeyCheck(e) { 
	var keyValue = event.keyCode; 
	if( ((keyValue >= 48) && (keyValue <= 57)) ) 
		return true; 
	else return false; 
}

function booltoint(value){
	if(value){
		return "1";
	}else
	{
		return "0";
	}
}

//두개의 날짜를 비교하여 차이를 알려준다.
function dateDiff(_date1, _date2,recom) {
    var diffDate_1 = _date1 instanceof Date ? _date1 : new Date(_date1);
    var diffDate_2 = _date2 instanceof Date ? _date2 : new Date(_date2);
 
    diffDate_1 = new Date(diffDate_1.getFullYear(), diffDate_1.getMonth()+1, diffDate_1.getDate());
    diffDate_2 = new Date(diffDate_2.getFullYear(), diffDate_2.getMonth()+1, diffDate_2.getDate());
 
    var diff = Math.abs(diffDate_2.getTime() - diffDate_1.getTime());
    diff = Math.ceil(diff / (1000 * 3600 * 24));
    if(recom)
    {
    	return diff;
    }
    if(diff > 7){
    	return (diffDate_1.getFullYear()+"-"+(diffDate_1.getMonth()+1)+"-"+(diffDate_1.getDate()));
    }else
    {
    	if(diff == 0){
    		return "오늘";
    	}else
    	{
    		return diff+"일전";
    	}
    }
    return diff;
}

function inttobool(value){
	if(value == 1){
		return true;
	}else
	{
		return false;
	}
}

function Kconfirm(text , title , func, nofunc ,closebl ){
	swal({
        title: text ,
        text: title ,
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "네",
        cancelButtonText: "아니오",
        closeOnConfirm: false,
        closeOnCancel: false },
    function (isConfirm) {
        if (isConfirm) {
        	if(closebl)confirmclose();
        	
        	if(func != null)func();
        	
        } else {
        	confirmclose();
        	if(nofunc != null)nofunc();
        	
        }
    });
}

function confirmclose(){
	swal.close();
}

function Kalert(title,text,func,option){
	var type;
	if(option != null){
		type = option.type;	
	}
	
	swal({
		html:true,
        title: title,
        text: text,
        type: (type == null ? "success":type)
    },func
    );
}

function Ktoast(option){
	var value = option.text;
	var title = option.title;
	var type = option.type;
	if(type == undefined || type == null){
		type = 0;
	}
          toastr.options = {
              closeButton: true,
              progressBar: true,
              showMethod: 'slideDown',
              timeOut: 4000
          };
          switch(type){
          	  case 0 :
          		toastr.success(value, title);
        	  break;
          	  case 1 :
            		toastr.info(value, title);
          	  break;
	          case 2 :
	        		toastr.warning(value, title);
	      	  break;
	          case 3 :
	        		toastr.error(value, title);
	      	  break;
          }
}

function kdisabledall(id,value){
	$('#'+id).find("input").prop('readonly', value);
	$('#'+id).find("div").prop('contentEditable', (value == true ? false : true ));
	$('#'+id).find("select").prop('disabled', value);
	$('#'+id).find(".lv_form_box").css('background-color', (value == true ? "#eee" : "white" ));
	$('#'+id).find("input:checkbox").prop('disabled', value);
	$('#'+id).find("input:radio").prop('disabled', value);
	
}

function getAge(jumin)
{
   var age=0;
   var jcode=jumin.split('-')[0];
 
   if (jcode.length==6) {
      var yy=jcode.substr(0,2);     //생년
      var mm=jcode.substr(2,2);    //생월
      var dd=jcode.substr(4,2);     //생일
  
      //생년 계산(80세 이전까지 적용하므로 첫자가 0~2이 아니면 1900년대/ 아니면 2000년대)
      var i=jcode.substr(0,1);
      cc=(i>2) ? '19':'20';
      var birthyear=cc+yy;
      var m = new Date().format("MM") * 1;
      var d = new Date().format("dd") * 1;
      var age=(new Date().format("yyyy") * 1)-birthyear;
  
      if (mm>m) 
         age--;
      else if (mm==m)
         if (dd<d) age--;
      return age+"세";
   }
}

function getGender(jumin){
	var jcode = jumin.split('-')[1].substring(0,1);
	if(jcode == 1){
		return "남";
	}else{
		return "여";
	}
}

function ifnull(value,revalue){
	if(value == undefined){
		return revalue;
	}else if(value == null){
		return revalue;
	}else{
		return value;
	}
	return value;
}

function checkcustom(array , value){
	   for(var i = 0 ; i < array.length ; i++){
		   if(array[i]["custom_seq"] == value)
		   {
				return false;   
		   }
			   
	   }
	   
	   return true;
}
