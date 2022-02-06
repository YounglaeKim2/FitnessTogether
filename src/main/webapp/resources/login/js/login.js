let social = {
	kakao : {
		data : {key : 'dce1a6b74b6037f0cc344d0b3f4d8a97'},
		init : function(){
			Kakao.init(social.kakao.data.key);},
		login : function (){
			Kakao.Auth.login({
				success: function (response){
					console.log("카카오 로그인 성공", response);
					social.kakao.info();
				},
				fail: function (error) {
					console.log("카카오 로그인 실패", error);},
			})
		},
		info : function (){
			Kakao.API.request({
				url: '/v2/user/me',
				success: function (response) {
					console.log("카카오 정보 불러오기 성공 ", response)
					let userInfo = {
						type : 'kakao',
						id : response.id,
						nm : response.properties.nickname,
						email : response.kakao_account.email,
						};
					socialGetInfo(userInfo);
					setTimeout(social.kakao.logout, 500);
						},
 				fail: function (error) {
					console.log("카카오 정보 불러오기 오류 ", error);
						},
			})
		},
		logout : function (){
			if (Kakao.Auth.getAccessToken()) {
			Kakao.API.request({
				url: '/v1/user/unlink',
			success: function (response) {
				console.log("카카오 로그아웃 성공", response);},
			fail: function (error) {
				console.log("카카오 로그아웃 실패", error);},
			})
			Kakao.Auth.setAccessToken(undefined)
			}
		},
	},
	google : {
		data : {
			clientId : '483006211482-dqpblg3p5vohf0sjag4dnvpur7505bfk.apps.googleusercontent.com',
			apikey : 'AIzaSyCUwv4FWi9ZN4iWTamiLzGDf9BtzUDUKhM',
		},
			init : function (elId){
				gapi.load('auth2', function() {
				gapi.auth2.init({client_id: social.google.data.clientId});
				let options = new gapi.auth2.SigninOptionsBuilder();
				options.setPrompt('select_account');
				options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
				gapi.auth2.getAuthInstance().attachClickHandler(elId, options, social.google.loginSuccess, social.google.logoutFail);
			});
		},
		loginSuccess : function (googleUser){
			 console.log("구글 로그인 성공", googleUser);
			let profile = googleUser.getBasicProfile();
				let userInfo = {
					type : 'google',
					id : profile.getId(),
					nm : profile.getName(),
					email : profile.getEmail(),
				};
			socialGetInfo(userInfo);
			setTimeout(social.google.logout, 500);
			},
		logoutFail : function (error){
			console.log("구글 로그인 실패", error);
		},
		logout : function (){
			let auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function () {
			 console.log('구글 로그아웃 성공 ');
			});
			}
		},
	facebook : {
			data : {
			appId : '1352297528534403',
			version: "v8.0",
			},
			init : function (){
				window.fbAsyncInit = function() {
					FB.init({
					appId      : social.facebook.data.appId,
					cookie     : true,
					xfbml      : true,
					version    : social.facebook.data.version
					});
					FB.AppEvents.logPageView();
					};
				},
			login : function (){
			FB.login(function(response) {
				if (response.status === 'connected') {
					console.log('로그인 성공',response);
					social.facebook.info();
				} else {
					console.log('로그인 실패',response);
					}
				}, {scope: 'public_profile,email'});
			},
			logout : function (){
			FB.logout(function(response) {
				console.log("페이스북 로그아웃 성공")
			});
			 },
			info : function (){
				FB.api('/me', 'get', {fields: 'name,email,id'}, function(r) {
					console.log("페이스북 정보 불러오기 성공", r);
				let userInfo = {
					type : 'facebook',
 					id : r.id,
					nm : r.name,
					email : r.email,
				};
				socialGetInfo(userInfo);
				setTimeout(social.facebook.logout, 500);
				});
			}
	}
}
