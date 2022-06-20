<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
function deviceCheckandInsert(token){
	Kajax("/action/deviceTokenCheck",{
		id : deviceid
		,token : token
	},function(res){
		if(res.success){
			if(res.rows["cnt"] == 0){
				Kajax("/action/deviceTokenUpdate",{
					id : deviceid
					,token : token
				},function(res){
					location.href = "/";
				})	
			}else{
				location.href ="/";
			}
		}else{
			location.href = "/";
		}
	})
}
var deviceid = "";
function checkdeviceload(id){
	deviceid = id;
	var IorA = navigator.userAgent.toLowerCase();
	try{
        if(IorA.indexOf("android") !== -1){
        	window.dangiljob.onload();
        }else if(IorA.indexOf("iphone") !== -1){
        	//alert("iphone");
        	window.webkit.messageHandlers.getDevice.postMessage("uuid"); // (JavaScript --> 앱)
        }else{
        	location.href = "/";	
        }
	}catch(e){
		location.href = "/";
	}
}

function getDeviceReturn(token){
	//alert(token);
	deviceCheckandInsert(token);
}

</script>