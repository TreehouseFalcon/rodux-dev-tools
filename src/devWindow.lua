local Roact = require(script.Parent.Parent.Roact)
local App = require(script.Parent.UI.App)
local store = require(script.Parent.Store)

local isMounted = false
local mountedTree = nil

local function setWindowVisibility(
	visibility: boolean,
	mountLocation: Instance?,
	wrapInScreenGui: boolean?
): boolean
	assert(
		typeof(visibility) == "boolean",
		`setWindowVisibility expects boolean, got {typeof(visibility)}`
	)
	assert(
		typeof(mountLocation) == "Instance" or mountLocation == nil,
		"mountLocation must be an Instance or nil"
	)

	if visibility ~= isMounted then
		if visibility then
			mountedTree = Roact.mount(
				Roact.createElement(App, {
					roduxStore = store,
					_wrapInScreenGui = wrapInScreenGui,
				}),
				if mountLocation
					then mountLocation
					else game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
			)
		else
			Roact.unmount(mountedTree)
			mountedTree = nil
		end

		isMounted = visibility
		return true
	end

	return false
end

local function toggleWindowVisibility()
	return setWindowVisibility(not isMounted)
end

return {
	toggleWindowVisibility = toggleWindowVisibility,
	setWindowVisibility = setWindowVisibility,
}
