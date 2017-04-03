<!-- Left Sidebar -->
<aside id="leftsidebar" class="sidebar">
	<!-- User Info -->
	<div class="user-info">
		<div class="image">
			<img src="images/user.png" width="48" height="48" alt="User" />
		</div>
		<div class="info-container">
			<div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">John Doe</div>
			<div class="email">john.doe@example.com</div>
			<div class="btn-group user-helper-dropdown">
				<i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
				<ul class="dropdown-menu pull-right">
					<li><a href="javascript:void(0);"><i class="material-icons">person</i>Profile</a></li>
					<li role="seperator" class="divider"></li>
					<li><a href="javascript:void(0);"><i class="material-icons">input</i>Sign Out</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- #User Info -->
	<!-- Menu -->
	<div class="menu">
		<ul class="list">
			<li class="header">MAIN NAVIGATION</li>
			<li class="active">
				<a href="index.jsp">
					<i class="material-icons">home</i>
					<span>Home</span>
				</a>
			</li>
			<li>
				<a href="index.jsp?p=student">
					<i class="material-icons">face</i>
					<span>Students</span>
				</a>
			</li>
			<li>
				<a href="index.jsp?p=enrollment">
					<i class="material-icons">directions_walk</i>
					<span>Enrollment</span>
				</a>
			</li>
			<li>
				<a href="index.jsp?p=payment">
					<i class="material-icons">payment</i>
					<span>Payment</span>
				</a>
			</li>
		
			<li>
				<a href="javascript:void(0);" class="menu-toggle">
					<i class="material-icons">assignment</i>
					<span>Admin Tools</span>
				</a>
                <ul class="ml-menu">
                    <li>
                        <a href="index.jsp?p=grade">Grades</a>
                    </li>
                    <li>
                        <a href="index.jsp?p=session">Sessions</a>
                    </li>
                    <li>
                        <a href="index.jsp?p=fee_type">Fee Types</a>
                    </li>
                    <li>
                        <a href="index.jsp?p=room">Rooms</a>
                    </li>
                    <li>
                        <a href="index.jsp?p=fee">Fees</a>
                    </li>
                    <li>
                        <a href="index.jsp?p=course">Courses</a>
                    </li>
                    <li>
                        <a href="index.jsp?p=course_room">Course Rooms</a>
                    </li>
                    <li>
                        <a href="index.jsp?p=user">Users</a>
                    </li>
                </ul>
			</li>
			<li>
				<a href="index.jsp?p=report">
					<i class="material-icons">insert_chart</i>
					<span>Reports</span>
				</a>
			</li>
			<li>
				<a href="api/user/logout">
					<i class="material-icons">forward</i>
					<span>Logout</span>
				</a>
			</li>
		</ul>
	</div>
	<!-- #Menu -->
</aside>
<!-- #END# Left Sidebar -->