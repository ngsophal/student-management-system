function ApiHelper (formSelector, resource, version){
	this.formSelector = formSelector;
	this.resource = resource;
	this.version = version;


	this.insert = function(){
		var data = $(this.formSelector).serialize();
		var apiKeyName = this.apiKeyName;
		return $.ajax({
			url:'api/' + this.resource + '/'+ this.version,
			type: 'POST',
			dataType: 'JSON',
			//headers : {'X-API-KEY' : 'sd3209Sdkl2DF3dfzsDGEsZ8476'},
			data: data
		});
	};

	this.update = function(id){
		var data = $(this.formSelector).serialize();
		return $.ajax({
			url:'api/' + this.resource + '/'+ this.version + '/' + id,
			type: 'POST',
			dataType: 'JSON',
			//headers : {'X-API-KEY' : 'sd3209Sdkl2DF3dfzsDGEsZ8476'},
			data: data
		});
	};

	this.remove = function(id){
		var data = $(this.formSelector).serialize();
		return $.ajax({
			url:'api/' + this.resource + '/'+ this.version +'/remove' ,
			type: 'POST',
			dataType: 'JSON',
			//headers : {'X-API-KEY' : 'sd3209Sdkl2DF3dfzsDGEsZ8476'},
			data: {id:id}
		});
	};

	this.getDetail = function(id, isAsync){
		if(isAsync == null) isAsync = true;
		return $.ajax({
			url:'api/' + this.resource + '/' + this.version + '/' + id,
			type: 'GET',
			dataType: 'JSON',
			//headers : {'X-API-KEY' : 'sd3209Sdkl2DF3dfzsDGEsZ8476'},
			async: isAsync
		});
	};

	this.getSubResource = function(id, subResource, isAsync){
		if(isAsync == null) isAsync = true;
		return $.ajax({
			url:'api/' + this.resource + '/' + this.version + '/' + id + '/'+subResource,
			type: 'GET',
			dataType: 'JSON',
			//headers : {'X-API-KEY' : 'sd3209Sdkl2DF3dfzsDGEsZ8476'},
			async: isAsync
		});
	};
	this.getAll = function(isAsync){
		if(isAsync == null) isAsync = true;
		return $.ajax({
			url:'api/' + this.resource + '/' + this.version + '/all',
			type: 'GET',
			dataType: 'JSON',
			//headers : {'X-API-KEY' : 'sd3209Sdkl2DF3dfzsDGEsZ8476'},
			async: isAsync
		});
	};

	this.getExistData = function(data, isAsync){
		if(isAsync == null) isAsync = true;
		return $.ajax({
			url:'api/' + this.resource + '/' + this.version + '/getExistData',
			type: 'GET',
			dataType: 'JSON',
			async: isAsync,
			data : data
		})

	};

}
