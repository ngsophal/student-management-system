function ApiHelper (formSelector, resource, version){
	this.formSelector = formSelector;
	this.resource = resource;
	this.version = version;
	
	this.insert = function(){
		var data = $(this.formSelector).serialize();
		return $.ajax({
			url:'api/' + this.resource + '/'+ this.version,
			type: 'POST',
			dataType: 'JSON',
			data: data
		});
	};
	
	this.update = function(id){
		var data = $(this.formSelector).serialize();
		return $.ajax({
			url:'api/' + this.resource + '/'+ this.version + '/' + id,
			type: 'POST',
			dataType: 'JSON',
			data: data
		});
	};
	
	this.remove = function(id){
		var data = $(this.formSelector).serialize();
		return $.ajax({
			url:'api/' + this.resource + '/'+ this.version +'/remove' ,
			type: 'POST',
			dataType: 'JSON',
			data: {id:id}
		});
	};
	
	this.getDetail = function(id){
		return $.ajax({
			url:'api/' + this.resource + '/' + this.version + '/' + id,
			type: 'GET',
			dataType: 'JSON'
		});	
	};

	this.getAll = function(){
		return $.ajax({
			url:'api/' + this.resource + '/' + this.version + '/all',
			type: 'GET',
			dataType: 'JSON'
		});
	}

};
