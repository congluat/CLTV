/**
 * AngularJS UserController Register Check username & email are in use Login
 * Logout
 * 
 */

angular
		.module('myApp')
		.controller(
				'UserController',
				function($scope, $http, $window) {

					$scope.user = {
						username : '',
						password : '',
						email : '',
						doB : '',
					};
					
					$scope.login={
							username : '',
							password : '',
							remember : false
					};
					
					
					$scope.result ={
							result:false,
							cause:''
					};
					
					$scope.register = function() {
						console.log("Register runned");
						var url = 'User/register';
						var data = {
							username : $scope.user.username,
							password : $scope.user.password,
							email : $scope.user.email,
							doB : $scope.user.doB,
						};

						var config = {
							headers : {
								'Content-Type' : 'application/json;'
							}
						}

						console.log(data);

						$http.post(url, data, config).success(
								function(data) {
									$scope.result = data;
									if(data.result==true){
										console.log("true"+data.cause);
										$('.register-modal').hide();
										$('.successed-modal').show();
										
									}else{
										console.log("false"+data.cause);
									}
								}).error(
								function(data) {
									console.log(data+status);
								});
						$scope.user ='';
					};
					
					$scope.login = function(){
						console.log("login runned");
						
						var url = 'User/login';
						var data = $.param({
							username : $scope.login.username+'',
							password : $scope.login.password+'',
							remember : $scope.login.remember
						});

						var config = {
							headers : {
								'Content-Type' : 'application/x-www-form-urlencoded;charset=utf-8;'
							}
						}

						console.log(data);

						$http.post(url, data, config).success(
								function(data) {
									$scope.result = data;
									if(data.result==true){
										console.log("true"+data.cause);
										
									}else{
										console.log("false"+data.cause);
									}
								}).error(
								function(data) {
									console.log(data+status);
								});
						
					};

				});