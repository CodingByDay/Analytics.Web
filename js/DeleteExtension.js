﻿function DeleteDashboardExtension(wrapper) {
	this._dashboarControl = wrapper.GetDashboardControl();
	this._performRequest = wrapper.PerformDataCallback.bind(wrapper);
	this.name = "dxdde-delete-dashboard";
	this._menuItem = {
		id: this.name,
		title: "Delete",
		click: this.deleteDashboard.bind(this),
		selected: ko.observable(false),
		disabled: ko.computed(function () { return !this._dashboarControl.dashboard(); }, this),
		index: 113,
		hasSeparator: true,
		data: this
	};
}

DeleteDashboardExtension.prototype.deleteDashboard = function () {
	if (this._toolbox) {
		if (confirm("Delete this Dashboard?")) {
			var dashboardid = this._dashboardControl.dashboardContainer().id;
			this._toolbox.menuVisible(false);
			$.ajax({
				url: 'Home/DeleteDashboard',
				data: { DashboardID: dashboardid },
				type: 'POST',
				success: (function () { this._dashboardControl.unloadDashboard(); }).bind(this)
			});
		}
	}
}

DeleteDashboardExtension.prototype.start = function () {
	this._toolbox = this._dashboarControl.findExtension('toolbox');
	this._toolbox && this._toolbox.menuItems.push(this._menuItem);
};

DeleteDashboardExtension.prototype.stop = function () {
	this._toolbox && this._toolbox.menuItems.remove(this._menuItem);
};