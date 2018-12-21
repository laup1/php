
    
    <script src="webroot/js/status/index.js"></script>
    
    </head>
<?php
$urlToRestApi = $this->Url->build('/api/status', true);
echo $this->Html->scriptBlock('var urlToRestApi = "' . $urlToRestApi . '";', ['block' => true]);
echo $this->Html->script('Status/index', ['block' => 'scriptBottom']);
?>
<!DOCTYPE html>
<html ng-app="app">
		<head>
			<meta charset="UTF-8">
			<title>Status index</title>
		</head>
		<body>
			<div ng-controller="StatusCRUDController">
				<table>
					<tr>
						<td width="100">id:</td>
						<td><input type="text" id="id" ng-model="statu.id" /></td>
					</tr>
					<tr>
						<td width="100">description_Status:</td>
						<td><input type="text" id="name" ng-model="statu.description_Status" /></td>
					</tr>


	</table>
				<br /> <br /> 
				<a ng-click="updateStatus(statu.id,statu.description_Status)">Update status</a> 
				<a ng-click="addStatus(statu.description_Status)">Add status</a> 
			<br /> <br />
			<p style="color: green">{{message}}</p>
			<p style="color: red">{{errorMessage}}</p>

			<table class="table table-striped">
							<thead>
								<tr>
									<th>Id</th>
									<th>description_Status</th>
									<th>Action</th>
								</tr>
							</thead>
										<tr ng-repeat="statu in status">
											<td>{{statu.id}}</td>
											<td>{{statu.description_Status}}</td>

											<td>
												<a href="javascript:void(0);" class="glyphicon glyphicon-edit" ng-click="getStatus(statu.id)"></a>
												<a href="javascript:void(0);" class="glyphicon glyphicon-trash" ng-click="deleteStatus(statu.id)"></a>
											</td>
										</tr>
						</table>

			</div>
		</body>
	</html>

        
        <?php $this->Html->script('Status/index', ['block' => 'scriptBottom']); ?>

<!-- page content and controls will be here -->

<div class="container" ng-app="CakeJwtAngularjs">
    <div class="container" ng-controller="usersCtrl" class="d-inline-block align-top-right">
        <!-- floating button for login -->
        <div id="login-btn" class="fixed-action-btn" style="top:45px; right:24px;">
            <a class="waves-effect waves-light btn margin-bottom-1em modal-trigger red" href="#modal-login-form"><i class="material-icons left">account_box</i>Login</a>
        </div>
        <!-- modal for user login -->
        <div id="modal-login-form" class="modal">
            <div class="modal-content">
                <h4 id="modal-login-title">Login</h4>
                <div class="row">
                    <div class="input-field col s12">
                        <input ng-model="username" type="text" class="validate" id="username" name="username" placeholder="Type username here..." />
                        <label for="username">Username</label>
                    </div>
                    <div class="input-field col s12">
                        <input ng-model="password" type="password" class="validate" id="password" name="password" placeholder="Type password here..." />
                        <label for="password">Password</label>
                    </div>
                    <div class="input-field col s12">
                        <a id="btn-create-login" class="waves-effect waves-light btn margin-bottom-1em" ng-click="login()"><i class="material-icons left">add</i>Login</a>
                        <a class="modal-action modal-close waves-effect waves-light btn margin-bottom-1em"><i class="material-icons left">close</i>Close</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- floating button for logout/change password -->
        <div id="logout-btn" class="fixed-action-btn" style="top:45px; right:24px;">
            <a class="waves-effect waves-light btn margin-bottom-1em modal-trigger red" href="#modal-logout-form"><i class="material-icons left">eject</i>Logout (Change Password)</a>
        </div>
        <!-- modal for user login -->
        <div id="modal-logout-form" class="modal">
            <div class="modal-content">
                <h4 id="modal-login-title">Logout or Change Password</h4>
                <div class="row">
                    <div class="input-field col s12">
                        <input ng-model="newPassword" type="password" class="validate" id="form-password" placeholder="Type password here..." />
                        <label for="password">New Password</label>
                    </div>                    
                    <div class="input-field col s12">
                        <a id="btn-create-login" class="waves-effect waves-light btn margin-bottom-1em" ng-click="changePassword()"><i class="material-icons left">autorenew</i>Change Password</a>
                        <a id="btn-create-login" class="waves-effect waves-light btn margin-bottom-1em" ng-click="logout()"><i class="material-icons left">eject</i>Logout</a>
                        <a class="modal-action modal-close waves-effect waves-light btn margin-bottom-1em"><i class="material-icons left">close</i>Close</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row"  ng-controller="statusCtrl">
        <div class="col s12">
            <h4>Status</h4>
            <!-- used for searching the current list -->
            <input type="text" ng-model="search" class="form-control" placeholder="Search status..." />

            <!-- table that shows subcategory record list -->
            <table class="hoverable bordered">

                <thead>
                    <tr>
                        <th class="text-align-center">ID</th>
                        <th class="width-30-pct">Name</th>
                        <th class="text-align-center">Action</th>
                    </tr>
                </thead>

                <tbody ng-init="getAll()">
                    <tr ng-repeat="d in names| filter:search">
                        <td class="text-align-center">{{ d.id}}</td>
                        <td>{{ d.name}}</td>
                        <td>
                            <a ng-click="readOne(d.id)" class="waves-effect waves-light btn margin-bottom-1em admAction"><i class="material-icons left">edit</i>Edit</a>
                            <a ng-click="deleteStatus(d.id)" class="waves-effect waves-light btn margin-bottom-1em admAction"><i class="material-icons left">delete</i>Delete</a>
                        </td>
                    </tr>
                </tbody>
            </table>
            <!-- modal for for creating new subcategory -->
            <div id="modal-editSubcategory-form" class="modal">
                <div class="modal-content">
                    <h4 id="modal-editSubcategory-title">Edit status</h4>
                    <div class="row">
                        <div>
                            <!-- pre>*** Debug *** Selected Category id : {{selectedCategoryId}}</pre>
                            <pre ng-show="editCategory">Selected Category : {{ editCategory | json }}</pre>
                            <pre ng-show="editCategories">{{ editCategories | json }}</pre -->
                            Categories: 
                            <select name="actualStatus_id"
                                    id="actualStatus-id" 
                                    class="browser-default"
                                    ng-model="editStatus" 
                                    ng-options="item.name for item in editStatus track by item.id"
                                    >
                            </select>
                        </div>
                        <div class="input-field col s12">
                            <label for="actualName">Name</label>
                            <input ng-model="actualName" type="text" class="validate" id="actualName" placeholder=" "/>
                        </div>
                        <div class="input-field col s12">
                            <a id="btn-update-subcategory" class="waves-effect waves-light btn margin-bottom-1em" ng-click="updateStatus()"><i class="material-icons left">edit</i>Save Changes</a>
                            <a class="modal-action modal-close waves-effect waves-light btn margin-bottom-1em"><i class="material-icons left">close</i>Close</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- modal for for creating new subcategory -->
            <div id="modal-createSubcategory-form" class="modal">
                <div class="modal-content">
                    <h4 id="modal-createSubcategory-title">Create New Status</h4>
                    <div>
                        <!-- pre ng-show="categories">{{ categories | json }}</pre -->
                        Status: 
                        <select name="newStatuss_id"
                                id="newStatus-id" 
                                class="browser-default"
                                ng-model="createStatus" 
                                ng-options="item.name for item in createStatus track by item.id"
                                >
                        </select>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input ng-model="newName" type="text" class="validate" id="newName" placeholder="Type name here..." />
                            <label for="newName">Name</label>
                        </div>
                        <div class="input-field col s12">
                            <a id="btn-create-subcategory" class="waves-effect waves-light btn margin-bottom-1em" ng-click="createStatus()"><i class="material-icons left">add</i>Create</a>
                            <a class="modal-action modal-close waves-effect waves-light btn margin-bottom-1em"><i class="material-icons left">close</i>Close</a>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- end col s12 -->
    </div> <!-- end row -->
</div> <!-- end container -->
<!-- floating button for creating subcategory -->
<div class="fixed-action-btn" style="bottom:45px; right:24px;">
    <a class="waves-effect waves-light btn margin-bottom-1em modal-trigger red" href="#modal-createSubcategory-form"><i class="material-icons left">add</i>New Status</a>
</div>





