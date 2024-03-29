<header>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
		<div class="navbar-header">
		  <h1 class="navbar-brand"><span class="glyphicon glyphicon-question-sign"></span> Questions</h1>
		</div>
		<div class="navbar-form navbar-right">
	
		  
		  <input type="text" class="form-control" placeholder="Search for..." ng-model="searchText">
		  
		
		<div class="btn-group " role="group">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add_question">Add Questions</button>
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
                        <th>Question&nbsp;</th>
                        <th>Category&nbsp;</th>
                        <th>Active &nbsp;</th>
                        <th>Created At &nbsp;</th>
                        <th>Action &nbsp;</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="item in questions | filter:searchText | orderBy:'-created'">
                        <td>{{$index + 1}}</td>
                        <td>{{item.question}}</td>
						<td>{{item.category}}</td>
						<td>{{item.active}}</td>
	                    <td>{{item.created | date :"dd MMM y | hh:mm a"}}</td>
						<td>
							<div class="btn-group-xs">
							  <button class="btn btn-info" type="button" ng-click="edit(item.id)">Edit</button>
							  <!--<button class="btn btn-danger" type="button"  ng-click="delete($index)">Remove</button>-->
							</div>
						</td>
                        
                    </tr>
					<tr ng-if="questions.length==0">
						<td class="text-center" colspan="6"><br/><br/><br/>Loading...<br/><br/><br/></td>
					</tr>
                </tbody>
            </table>
		</div>
	</div>
	
	<div id="add_question" class="modal fade">
	  <div class="modal-dialog">
	  <form name="From" novalidate>
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title">Add New Question</h4>
		  </div>
		  <div class="modal-body">
			<div class="form-group">
				<label for="item_name">Question</label>
				<input type="text" class="form-control" id="item_name" placeholder="Enter Question" ng-model="item.question" required>
			</div>
			  
			<div class="form-group">
				<label for="category">Select Category </label>
				<select class="form-control" id="category" placeholder="Select Category" ng-model="item.category" required>
					<option value="">Select Category</option>
					<option ng-repeat="option in categories" value="{{option.category}}">{{option.category}}</option>
				</select>
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
</main>
					