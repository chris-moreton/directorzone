angular.module('experience', []).controller('ExperienceController', function($scope, $http) {
	$scope.companyname='';
	$scope.companies = [];
	$scope.history = [];
	$scope.selectedJobArea = [];
	$scope.selectedJobStatus = [];
	$scope.selectedCommitteeRole = [];
	
	function loadLookupData(resourceName)
	{
		var responsePromise = $http.get('/api/lookup/' + resourceName);
		
        responsePromise.success(function(data, status, headers, config) {
        	$scope.lookups[resourceName] = data._embedded[resourceName];
        });
        
        responsePromise.error(function(data, status, headers, config) {
            alert("Loading lookup data for " + resourceName + " failed.");
        });
	}

	$scope.lookups = [];
	
	$scope.lookups.jobstatus = [];
	loadLookupData('jobstatus');
	
	$scope.lookups.committeerole = [];
	loadLookupData('committeerole');
	
	$scope.lookups.jobarea = [];
	loadLookupData('jobarea');
	
	$scope.$watch(function() {return element.attr('class'); }, function(newValue){ alert(newValue);});
	
	$scope.autocomplete = function() {
		
		var responsePromise = $http.get('/ajax/company/search?format=autocomplete&limit=200&name=' + this.companyname);
		var companies = $scope.companies;
		
        responsePromise.success(function(data, status, headers, config) {
        	companies.length = 0;
        	for (i=0; i<data.length; i++) {
        		var companyDetails = data[i].source;
        		companyDetails['arrayindex'] = i;
        		companies.push(companyDetails);
        	}
        });
        
        responsePromise.error(function(data, status, headers, config) {
            alert("Autocomplete AJAX failed!");
        });
	};
	
	function loadHistory() {
		var historyPromise = $http.get('/ajax/experience/history');
		
		historyPromise.success(function(data, status, headers, config) {
			$scope.history = [];
			for (var i=0; i<data.length; i++) {
				$scope.history[i] = {
					'arrayindex': i,
					'companyid': data[i].companydirectoryid,
					'name': data[i].name,
					'startdate': '',
					'enddate': '',
					'jobtitle': '',
					"jobstatus":$scope.lookups.jobstatus[0],
					'jobarea': {'jobareaid':1},
					"committeerole":{"committeeroleid":1,"committeerole":"Audit"}
				};
			}
		});
		
		historyPromise.error(function(data, status, headers, config) {
			alert("Load history AJAX failed!");
		});
	}
	
	function updateHistory() {

		var historyPromise = $http.post('/ajax/experience/history', $scope.history);
		
		historyPromise.success(function(data, status, headers, config) {
		});
		
		historyPromise.error(function(data, status, headers, config) {
			alert("History AJAX failed!");
		});
	}
	
	$scope.showhistory = function(arrayindex) {
		alert(JSON.stringify($scope.history[arrayindex]));
	}
	
	$scope.select = function(arrayindex) {
		
		$scope.history.push({
			'arrayindex': $scope.history.length,
			'companyid': $scope.companies[arrayindex].companydirectoryid,
			'name': $scope.companies[arrayindex].name,
			'startdate': '',
			'enddate': '',
			'jobtitle': '',
			'jobstatus': {},
			'jobarea': {},
			'committeerole': {}
		});
		
		var elementId = '#companyid-' + $scope.companies[arrayindex].companyid;
		
		setTimeout(function () {
			$(elementId).css('display', 'none');
			$(elementId).fadeIn(1200, function () {});
		}, 0);
		
		$scope.companies = [];
		
		updateHistory();
	}
	
	$scope.remove = function(companyId) {
		
		if (confirm('Do you wish to remove this company from your history?')) {
			var elementId = '#companyid-' + companyId;
			
			$(elementId).fadeOut('slow', function () {
				var foundIndex = -1;
				
				for (var i=0; i<$scope.history.length; i++) {
					if ($scope.history[i].companyid == companyId) {
						foundIndex = i;
						break;
					}
				}
		
				if (foundIndex != -1) {
					$scope.history.splice(foundIndex, 1);
				}
				
				setTimeout(function () {
					updateHistory();
				});
			});

		}
	}
	
	function setupDatefields()
	{
		alert(1);
		$('.date-entry').datepicker( { 
			changeYear: true, yearRange: "1920:2020",
			dateFormat: "yy-mm-dd",
			inline: true,
			defaultDate: 0,
	        showOtherMonths: true,  
	        dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']}
		);
	}
	
	loadHistory();

});