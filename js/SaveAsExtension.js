﻿function SaveAsDashboardExtension(dashboardControl) {
	this._dashboardControl = dashboardControl;
	this._menuItem = {
		id: "dashboard-save-as",
		title: "Save As...",
		template: "dx-save-as-form",
		selected: ko.observable(true),
		disabled: ko.computed(function () { return !dashboardControl.dashboard(); }),
		index: 112,
		data: this
	};
	this.newName = ko.observable("New Dashboard Name");
}

SaveAsDashboardExtension.prototype.saveAs = function () {
	if (this.isExtensionAvailable()) {
		this._toolbox.menuVisible(false);
		var old_name = this._dashboardControl.dashboard().Title;
		var json = this._dashboardControl.dashboard().getJSON();
		var stringified = JSON.stringify(json);
		stringified = stringified.replace(old_name, this.newName);
		var jsonObject = JSON.parse(stringified);
	   this._newDashboardExtension.performCreateDashboard(this.newName(), jsonObject);
	

	}
};

SaveAsDashboardExtension.prototype.isExtensionAvailable = function () {
	return this._toolbox !== undefined && this._newDashboardExtension !== undefined;
}

SaveAsDashboardExtension.prototype.start = function () {
	this._toolbox = this._dashboardControl.findExtension("toolbox");
	this._newDashboardExtension = this._dashboardControl.findExtension("create-dashboard");

	if (this.isExtensionAvailable())
		this._toolbox.menuItems.push(this._menuItem);
};

SaveAsDashboardExtension.prototype.stop = function () {
	if (this.isExtensionAvailable())
		this._toolbox.menuItems.remove(this._menuItem);
}