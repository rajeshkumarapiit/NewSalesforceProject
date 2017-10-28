/* Supervision table css */
.Supervision {
	width:100%;
	border-collapse:collapse;
}

.Supervision td {
	border:1px solid black;/* Keep same border as in #dashboard padding */
}

.Supervision thead {
	border:1px solid black;
	background-color:rgb(216,235,240);
}

/* Dashboard div fit the size of the dashboard */
.dashboard {
	overflow-y:scroll;
	height:400px;
	padding-right:1px;
}

/* Show / hide parameters */
.parameters {
	display:none;
}

.hide {
	display:none; 
}

.show {
	display:inline; 
}

.hide, .show {
	width:30px;
	height:30px;
	font-size:15px;
	text-align:center;
	text-decoration:none;
	margin-bottom:25px;
}

.hide:hover, .show:hover {
	cursor:pointer;
	text-decoration:none;
}