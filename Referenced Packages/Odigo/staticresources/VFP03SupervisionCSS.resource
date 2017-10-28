/* Supervision table css */
.Supervision {
	width:100%;
	border-collapse:collapse;
}

.Supervision td {
	border:1px solid black;/* Keep same border as in #dashboard padding */
}

.Supervision thead {
	border: 1px solid black;
	background-color: rgb(216,235,240);
}

/* Dashboard div fit the size of the dashboard */
#dashboard {
	overflow-y: auto;
	height: 600px;
	padding-right: 1px;
}

/* Show / hide parameters */
.parameters {
	display:none;
}

.hide {
	display:none; 
	cursor:pointer;
}

.show {
	display:inline; 
	cursor:pointer;
}

.hide, .show {
	width: 30px;
	height: 30px;
	font-size: 11pt;
	text-align: center;
	text-decoration: none;
	margin-bottom: 25px;
}

.hide:hover, .show:hover {
	text-decoration: none;
}

.orangeClass {
	background-color: #FFA62F!important;
	font-weight: bold!important;
}
.greenClass {
	background-color: #54C571!important;
	font-weight: bold!important;
}
.blueClass {
	background-color: #1589FF!important;
	font-weight: bold!important;
}
.redClass {
	background-color: #F62217!important;
	font-weight: bold!important;
}
.whiteClass {
	background-color: transparent;
}

.dashboardTable {
	border: 1px solid #e0e3e5;
	background-color: #fff;
	border-top: 1px solid #e0e3e5;
	display: table;
	border-collapse: separate;
	border-spacing: 2px
}

.dashboardTable tr.headRow {
	background: #f2f3f3;
	border-width: 0 0 1px 1px;
	border-color: #e0e3e5;
	color: #000;
	font-size: .9em;
	font-weight: bold;
	padding: 5px 2px 4px 5px;
}

.dashboardTable tr.headRow th {
	background: #f2f3f3;
	border-width: 0 0 1px 1px;
	border-color: #e0e3e5;
	color: #000;
	font-size: .9em;
	font-weight: bold;
	padding: 5px 2px 4px 5px;
}
table.dashboardTable tr td {
	border: 1px solid #ededed;
	color: #000;
}
table.dashboardTable tr.headerRow th {
	background: #f2f3f3;
	border-width: 0 0 1px 1px;
	border-color: #e0e3e5;
	color: #000;
	font-size: .9em;
	font-weight: bold;
	padding: 5px 2px 4px 5px;
}
