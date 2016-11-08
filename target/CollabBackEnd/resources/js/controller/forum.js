
	var app = angular.module('webapp', []);
	
	app.controller('ForumListController', ['$http', '$scope', function($http, $scope) {
		var self = this;
		self.collections = {};
		self.error = '';
		$scope.refreshForumList = function() {		
		$http.get("admin/forum/all")
			.then(function mySuccess(response){
				
				self.collections = response.data;
			}, function myError(response) {
				self.error = response.statusText;
			}
		)}
		$scope.refreshForumList();
		
		
	$scope.removeForum = function(id) {
		if(confirm("Are you sure you want to remove this forum?")) {
				$http["delete"]("admin/remove/"+id)
				.then(function mySuccess(response){
					alert('Blog is deleted!');
					$scope.refreshForumList();
					
				});
		}}

	
	}]);
	

	app.controller('ForumController', ['$http', function($http) {
		var self = this;
		self.collection = {};
		self.error = '';
		//alert(forumId);
		$http.get("post/all/" + forumId)
			.then(function mySuccess(response){
				self.collection = response.data;
			}, function myError(response) {
				self.error = response.statusText;
			}
		)
	}]);
	
	
	app.controller('PublicForumListController', ['$http', function($http) {
		var self = this;
		self.forums = {};
		self.error = '';
		
		
		$http.get("forums/all")
			.then(function mySuccess(response){
				self.forums = response.data;
			}, function myError(response) {
				self.error = response.statusText;
			}
		)
		
	}]);
	 	
	
	app.controller('PublicForumController', ['$http', function($http) {
		var self = this;
		self.forum = {};
		self.error = '';
		
		$http.get("get/forum/" + forumId)
			.then(function mySuccess(response){
				self.forum = response.data;
			}, function myError(response) {
				self.error = response.statusText;
			}
		)
		
	}]);
	