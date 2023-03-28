local devWindow = require(script.devWindow)

return {
	toggleWindowVisibility = devWindow.toggleWindowVisibility,
	setWindowVisibility = devWindow.setWindowVisibility,
	useDevTools = require(script.useDevTools),
}
