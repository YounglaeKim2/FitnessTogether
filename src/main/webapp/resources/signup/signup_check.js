/*
* 회원가입시 각 항목에 대한 입력 유효성 판단 

var space = /\s/g; 
var join = {
	 common: { 
		empty: {code: 'invalid', desc: '입력하세요'},
		 space: {code: 'invalid', desc: '공백 없이 입력하세요'},
	 min: {code: 'invalid', desc: '최소 5자 이상 입력하세요'},
 max: {code: 'invalid', desc: '최대 10자 이내로 입력하세요'} 
},
 id: {
	 valid: { code:'valid', desc: '사용가능한 아이디입니다' }
 },
 id_status: function(id) {
	 if(id == '') { 
		return this.common.empty;
		 } else if(id.match(space)) {
			 return this.common.space; 
		} else if(id.length < 5) { 
			return this.common.min;
			 } else if(id.length > 10) { 
				return this.common.max; 
				} else { return this.id.valid; 
				} 
				},
				 tag_status: function(tag) { 
					var data = tag.val(); 
					tag = tag.attr('name');
					 if(tag == 'id') {
						 data = this.id_status(data);
					 } return data; } }
*/ 