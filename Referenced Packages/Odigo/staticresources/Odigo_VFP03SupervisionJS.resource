//////////////////////////// Hack IE ///////////////////////////
if(!Array.indexOf){
	Array.prototype.indexOf = function(obj){
		for(var i=0; i<this.length; i++){
			if(this[i]==obj){
				return i;
			}
		}
		return -1;
	}
}

//Hide unhide parameters
function showParameters(pKpiType) {
	document.getElementById(pKpiType + 'hide1').style.cssText = 'display:inline;';
	document.getElementById(pKpiType + 'show1').style.cssText = 'display:none;';
	document.getElementById(pKpiType + 'checkDiv').style.cssText = 'display:block;';
}

function hideParameters(pKpiType) {
	document.getElementById(pKpiType + 'hide1').style.cssText = 'display:none;';
	document.getElementById(pKpiType + 'show1').style.cssText = 'display:inline;';
	document.getElementById(pKpiType + 'checkDiv').style.cssText = 'display:none;';
}


//Build the list of checkboxes
function buildCheckboxes(pKpiType) {
	var checkList = '<table><tr>';
	var i = 0;
	var n = 4;// => KPIs column number
	for(var keyKPI in KPIs) {
		if (i % n == 0 && checkList != '<table><tr>') {
			checkList += '</tr><tr>';
		}
		checkList += '<td><input id="'+keyKPI+'" type="checkBox" onclick="manageKPIVisibility(\''+pKpiType+'\', \''+keyKPI+'\')" />' + KPIs[keyKPI][userLang] + '</td>';
		i++;
	}
	document.getElementById(pKpiType + "checkDiv").innerHTML = checkList + '</tr></table>';
}

buildCheckboxes(kpiType);
//\

//Function to hide/unhide the KPIs
function manageKPIVisibility(pKpiType, keyKPI) {
	var checkBox = document.getElementById(keyKPI);
	setCookie(keyKPI, checkBox.checked);
	
	var styleSheet = document.getElementById(pKpiType + 'KPIStyleId').sheet || document.getElementById(pKpiType + 'KPIStyleId').styleSheet;
	var sheetRules = styleSheet.cssRules || styleSheet.rules;
	for (var i = 0; i < sheetRules.length; i++) {
		if (sheetRules[i].selectorText == '.' + keyKPI) {
			if (!checkBox.checked) {
				sheetRules[i].style.cssText = 'display:none;';
			} else {
				sheetRules[i].style.cssText = '';
			}
		}
	}
}

function initKPIVisibility(pKpiType) {
	var checkDiv = document.getElementById(pKpiType + 'checkDiv');
	var vTabAgentChecked = [ 'agent_65', 'agent_6', 'agent_63', 'agent_14', 'agent_3', 'agent_54', 'agent_48' ];
	var vTabGTChecked = [ 'gt_20', 'gt_18', 'gt_17', 'gt_35', 'gt_37', 'gt_36', 'gt_24' ];
	
	for (var i = 0; i < checkDiv.childNodes[0].childNodes[0].childNodes.length; i++) {// table => tbody => trs
		for (var j = 0; j < checkDiv.childNodes[0].childNodes[0].childNodes[i].childNodes.length; j++) {// tds
			var vId = checkDiv.childNodes[0].childNodes[0].childNodes[i].childNodes[j].childNodes[0].id;
			var cookieValue = getCookie(vId);
			if (cookieValue != null) {
				checkDiv.childNodes[0].childNodes[0].childNodes[i].childNodes[j].childNodes[0].checked = (cookieValue == 'true' ? true : false);
			} else {
				if (vTabAgentChecked.indexOf(vId) != -1 || vTabGTChecked.indexOf(vId) != -1) {
					checkDiv.childNodes[0].childNodes[0].childNodes[i].childNodes[j].childNodes[0].checked = 'true';
				}
			}
			manageKPIVisibility(pKpiType, checkDiv.childNodes[0].childNodes[0].childNodes[i].childNodes[j].childNodes[0].id);
		}
	}
}

initKPIVisibility(kpiType);
//\

//Functions for cookies managment
function setCookie(c_name, value, exdays) {
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var c_value = escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
	document.cookie = c_name + "=" + c_value;
}

function getCookie(c_name) {
	var c_value = document.cookie;
	var c_start = c_value.indexOf(" " + c_name + "=");
	if (c_start == -1) {
		c_start = c_value.indexOf(c_name + "=");
	}
	if (c_start == -1) {
		c_value = null;
	} else {
		c_start = c_value.indexOf("=", c_start) + 1;
		var c_end = c_value.indexOf(";", c_start);
		if (c_end == -1) {
			c_end = c_value.length;
		}
		c_value = unescape(c_value.substring(c_start,c_end));
	}
	return c_value;
}
//\