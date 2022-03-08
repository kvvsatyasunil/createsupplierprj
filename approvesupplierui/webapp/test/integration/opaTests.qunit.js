/* global QUnit */
QUnit.config.autostart = false;

sap.ui.getCore().attachInit(function () {
	"use strict";

	sap.ui.require(["com/ts/mdg/ui/approvesupplierui/test/integration/AllJourneys"
	], function () {
		QUnit.start();
	});
});
