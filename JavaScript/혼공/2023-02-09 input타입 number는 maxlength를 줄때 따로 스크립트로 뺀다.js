//점수, 순서 길이 체크 
function fn_length(obj) {
	if(obj.value.length > obj.maxLength){
		obj.value = obj.value.slice(0, obj.maxLength);
	}
	
	if(obj.value >= 10) {
		alert("점수는 10점 이하로 입력하여주세요.");
		obj.value = "";
		return false;
	}
	
	if(obj.name = 'input에 들어간 이름') {
		if(obj.value > 5) {
			alert("순서는 5이하로 입력하여주세요.");
			obj.value = "";
			return false;
		}
	}
}
