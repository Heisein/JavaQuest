/**
 * get방식으로 받은 파라미터를 분리하는 라이브러리
 */


var params = new Array();
spliter();
function spliter() {
	var param = window.location.search;
	var URI;
	URI=decodeURIComponent(param);
	URI=param.substring(1, param.length);
	var array = URI.split("&");         //uri에서 &기준으로 param을 분류하여 배열에 담음
	for(var cnt=0; cnt<array.length ; cnt++) {
		
		var split=array[cnt].split("=");
		var param=split[0];
		var value=split[1];
		params.push(param);
		params.push(value);
		
	}

}

function paramSpliter(object, paramName) {
	var array = object.split("&");
	var newParams=new Array();
	for(var cnt=0; cnt<array.length; cnt++){
		var split=array[cnt].split("=");
		var param=split[0];
		var value=split[1];
		newParams.push(param);
		newParams.push(value);
	}

	var result;
	for(var cnt=0; cnt<newParams.length; cnt++) {
		if(newParams[cnt]==paramName) {
			result=newParams[cnt+1];
		}
	}
	return result;
}

function getParam(value) {
	var result;
	for(var cnt=0 ; cnt<params.length; cnt++) {
		if(params[cnt]==value) {
			result=params[cnt+1];
			break;
		}
	}
	return result;
}