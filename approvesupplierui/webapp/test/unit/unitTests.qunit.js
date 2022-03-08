/* global QUnit */
QUnit.config.autostart = false;

sap.ui.getCore().attachInit(function () {
	"use strict";

	sap.ui.require([
		"comtsmdgui/approvesupplierui/test/unit/AllTests"
	], function () {
		QUnit.start();
	});
});
