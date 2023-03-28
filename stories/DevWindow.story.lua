local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RoduxDevTools = require(ReplicatedStorage.Packages.RoduxDevTools)

return function(target: Instance): () -> nil
	RoduxDevTools.setWindowVisibility(true, target)

	return function()
		RoduxDevTools.setWindowVisibility(false)
	end
end
