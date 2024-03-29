<header>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
		<div class="navbar-header">
		  <h1 class="navbar-brand"><span class="glyphicon glyphicon-th"></span> Categories</h1>
		</div>
		<div class="navbar-form navbar-right">
	
		  
		  <input type="text" class="form-control" placeholder="Search for..." ng-model="searchText">
		  
		
		<div class="btn-group " role="group">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add_category">New Category</button>
		</div>
		</div>
		</div><!-- /.navbar -->
	</nav>
</header>
<main>
	<div class="container-fluid">
		<div class="page-content">
			<table class="table table-hover">
                <thead>
                    <tr>
                        <th>SN&nbsp;</th>
                        <th>
							<a href="#" ng-click="sortType = 'category'; sortReverse = !sortReverse">
								Category&nbsp;								
								<span ng-show="sortType == 'category' && !sortReverse" class="glyphicon glyphicon-triangle-bottom"></span>
								<span ng-show="sortType == 'category' && sortReverse" class="glyphicon glyphicon-triangle-top"></span>
							</a>
						</th>
                        <th>
							<a href="#" ng-click="sortType = 'weight'; sortReverse = !sortReverse">
								Weight&nbsp;
								<span ng-show="sortType == 'weight' && !sortReverse" class="glyphicon glyphicon-triangle-bottom"></span>
								<span ng-show="sortType == 'weight' && sortReverse" class="glyphicon glyphicon-triangle-top"></span>
							</a>
						</th>                        
                        <th>
							<a href="#" ng-click="sortType = 'created'; sortReverse = !sortReverse">
								Created At&nbsp;
								<span ng-show="sortType == 'created' && !sortReverse" class="glyphicon glyphicon-triangle-bottom"></span>
								<span ng-show="sortType == 'created' && sortReverse" class="glyphicon glyphicon-triangle-top"></span>
							</a>
						</th>
						<th>Action &nbsp;</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="item in categories | filter:searchText | orderBy:sortType:sortReverse">
                        <td>{{$index + 1}}</td>
                        <td>{{item.category}}</td>
                        <td>{{item.weight}}</td>
                        <td>{{item.created | date :"dd MMM y | hh:mm a"}}</td>
						<td>
							<div class="btn-group-xs">
							  <button class="btn btn-info" type="button" ng-click="edit(item)">Edit</button>
							  <button class="btn btn-danger" type="button"  ng-click="delete($index)">Remove</button>
							</div>
						</td>
                    </tr>
					<tr ng-if="categories.length==0">
						<td class="text-center" colspan="5"><br/><br/><br/>Loading...<br/><br/><br/></td>
					</tr>
                </tbody>
            </table>
		</div>
	</div>
	<div id="add_category" class="modal fade">
	  <div class="modal-dialog">
	  <form name="From" novalidate>
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title">Add New Category</h4>
		  </div>
		  <div class="modal-body">
			<div class="form-group">
				<label for="item_name">Category Name</label>
				<input type="text" class="form-control" id="item_name" placeholder="Item Name" ng-model="item.category" required>
			</div>
			  
			<div class="form-group">
				<label for="weight">Weight</label>
				<input type="text" class="form-control" id="weight" placeholder="Weight" ng-model="item.weight" required>
			</div>
			  		 
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			<button type="submit" class="btn btn-primary" ng-click="save()">Save</button>
		  </div>
		</div><!-- /.modal-content -->
		</form>
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<div id="edit_category" class="modal fade">
	  <div class="modal-dialog">
	  <form name="From" novalidate>
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title">Edit Category</h4>
		  </div>
		  <div class="modal-body">
			<div class="form-group">
				<label for="item_name">Category Name</label>
				<input type="text" class="form-control" id="item_name" placeholder="Item Name" ng-model="item.category" required>
			</div>
			  
			<div class="form-group">
				<label for="weight">Weight</label>
				<input type="text" class="form-control" id="weight" placeholder="Weight" ng-model="item.weight" required>
			</div>
			  		 
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			<button type="submit" class="btn btn-primary" ng-click="update()">Save Changes</button>
		  </div>
		</div><!-- /.modal-content -->
		</form>
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</main>
					