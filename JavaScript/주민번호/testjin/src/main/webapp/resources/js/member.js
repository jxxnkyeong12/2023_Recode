/**
 * 회원정보의 유효성 판단처리
 */

 var member = {
	tag_status : function( tag ) {  //태그를 파라메터로 가져올것이고
		var name = tag.attr('name'); //이 태그의 name을 보고 판단한다
		
		if(name == 'mb_name')  return this.mb_name_status(tag.val() ); //만약 name이 mb_pw인 경우 (pw)의 파라메터를 넘겨줘야 하니까 이 tag가 가지고 있는 .val()값!
		else if (name =='mb_email') return this.mb_email_status(tag.val());
		else if (name == 'mb_pw') return this.mb_pw_status( tag.val() );
		else if (name == 'mb_pw_chk') return this.mb_pw_chk_status( tag.val() );
		else if (name == 'ResidentNumber') return this.ResidentNumber_status( tag.val() );
	},
	
	
	
	//주민번호 유효성 검사 
	ResidentNumber_status : function (ResidentNumber) {
	
	   var reg1 =  /^[0-9]*$/;
	   var reg = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-8][0-9]{6}$/;
	   var reg2 = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1])12)[1-8][0-9]{6}$/;
	   if( ResidentNumber == '')                    return this.common.empty;
	   else if (!(reg.test( ResidentNumber )||reg2.test(ResidentNumber)) )        return this.ResidentNumber.invalid;
	   else if ( !reg1.test( ResidentNumber ) )        return this.ResidentNumber.notNum;
	  
	   else                                         return this.ResidentNumber.valid;
		
	},
	
	ResidentNumber : {
		 invalid : { code: 'invalid', desc : '유효하지 않은 주민번호입니다'},
		 notNum : { code: 'invalid', desc : '정수만 입력해주세요'},
	     valid : { code: 'valid', desc : '유효한 주민번호입니다'},
	},
	
	//이메일 입력값 상태 확인 : 이메일 형식
	mb_email_status: function (mb_email){
		var reg = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
		if( mb_email =='' )  return this.common.empty;
		else if ( mb_email.match(this.sapce) )   return this.common.space;
		else if (reg.test( mb_email) )    return this.mb_email.valid;
		else if ( mb_email.length < 5 )                return this.common.min;
		else if ( mb_email.length > 10 )                return this.common.max;
		else 							return this.mb_email.invalid;
	},
	
	//이메일에 대한 값을 표현할 속성값 생성
	mb_email : {
		valid : { code: 'valid', desc : '유효한 이메일'},
		invalid : { code: 'invalid', desc : '유효하지 않은 이메일'}
	},
	
	
	
	
	
    //이름 입력값 상태확인
	mb_name_status: function(mb_name) {
		var reg = /^[가-힣]{2,5}$/;
		if(mb_name == '') return this.common.empty;
		else if(mb_name.match(this.sapce)) return this.common.space;
		else if(!reg.test(mb_name)) return this.mb_name.invalid;
		else if(mb_name.length < 2) return this.mb_name.min;
		else if(mb_name.length > 5) return this.mb_name.max;
		else return this.mb_name.valid;
	},
	
	//이름 관련 상태값
	mb_name: {
		min: { code: 'invalid', desc: '2자 이상 입력해주세요'},
		max: { code: 'invalid', desc: '4자 이하 입력해주세요'},
		invalid: { code: 'invalid', desc: '한글 2자~4자로 입력해주세요'},
		valid: { code: 'valid', desc: '사용 가능한 이름'}
	},
	
	
	
		//아이디 중복확인 상태를 판단할 함수 추가
	id_check: function( usable ) { //여기로true가 들어오면
		//존재하는 경우 : 1 (true -> 이미 사용중), 아니면 0 (false-> 사용가능) 
		if( usable )      return this.mb_email.unusable;
		else 				return this.mb_email.usable;
		
	},
	
	
	//아이디에만 적용될 값을 하나 선언해주자
	mb_email : {
		usable: {code: 'valid', desc: '사용가능한 아이디'},
		unusable: {code: 'invalid', desc: '이미 사용중인 아이디'},
		invaild : {code : 'invalid', desc : '아이디는 영문 소문자, 숫자만 입력'},
		valid : {code: 'valid' , desc : '아이디 중복확인하세요'} 
		
	},
	
	
	//비밀번호 확인 입력값 상태 확인 : 비밀번호와 입력값이 동일한지만 판단하면 된다.
	mb_pw_chk_status : function(mb_pw_chk) {
			//같은지만 판단하자.
			if(mb_pw_chk=='')                                  return this.common.empty;
			else if ( mb_pw_chk == $('[name =mb_pw]').val() )  return this.mb_pw.equal; //입력값이 두개가 일치한다면! 비밀번호가 일치합니다 해당하는 것을 해줘야지 (비밀번호 상태값)
			
			else  return this.mb_pw.notEqual;
	},
	
	
	
	//비밀번호 입력값 상태 확인 :영문 대, 소문자, 숫자를 모두 포함 
	//패스워드를 잘 입력했는지의 여부를 판단해줘야지 되고, pw 입력 여부 판단할 함수 선언 
	mb_pw_status : function( mb_pw ) { //입력된 pw를 보고 판단
		var reg = /[^a-zA-Z0-9]/g, upper=/[A-Z]/g, lower=/[a-z]/g, digit=/[0-9]/g;//정규식!
	
			if(mb_pw == '' )                                 return this.common.empty; 
			else if ( mb_pw.match(this.sapce))    return this.common.space;
			else if (reg.test(mb_pw))   				 return this.mb_pw.invalid; 
			else if ( mb_pw.length < 5 )      	     return this.common.min;
			else if ( mb_pw.length > 10 )    			 return this.common.max;
		    else if ( ! upper.test(mb_pw) || ! lower.test(mb_pw) || ! digit.test(mb_pw) ) return this.mb_pw.lack; 
			else 												return this.mb_pw.valid;
	
	},
	
	//비밀번호 관련 상태값 
	mb_pw: {
		equal : {code: 'valid', desc : '비밀번호 일치!'},
		notEqual : {code: 'invalid', desc : '비밀번호가 일치하지 않습니다!'},
		valid : { code : 'valid', desc : ' 사용가능한 비밀번호!'},
		invalid : { code : 'invalid', desc : ' 영문 대/소문자, 숫자만 입력!'},
		lack : {code : 'invalid', desc : '영문 대/소문자, 숫자를 모두 포함'}
	},
	
	
	//공백에 관한 데이터도 하나 선언해주자
	sapce: /\s/g,
	
	//공통사용 상태값!  객체를 선언
	common: {
		 empty : {code: 'invalid', desc : '입력하세요'},
		 space : {code: 'invalid', desc : '공백없이 입력하세요!'},
		 min : {code : 'invalid', desc : '5자 이상 입력하세요'},
		 max : {code : 'invalid', desc : '10자 이내로 입력하세요'}
		
		
	}
	
}