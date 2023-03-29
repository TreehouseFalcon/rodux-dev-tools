set positional-arguments := true

lint +files="src/":
	selene src/ tests/
	curl -o dumpRobloxTypes.py https://raw.githubusercontent.com/JohnnyMorganz/luau-lsp/main/scripts/dumpRobloxTypes.py
	python dumpRobloxTypes.py > globalTypes.d.lua
	curl -o testez.d.lua https://raw.githubusercontent.com/Roblox/rodux/master/testez.d.lua
	rojo sourcemap test.project.json > sourcemap.json
	luau-lsp analyze --sourcemap=sourcemap.json --definitions=globalTypes.d.lua --base-luaurc=.luaurc --ignore=Packages/** --ignore=DevPackages/** src/
	luau-lsp analyze --sourcemap=sourcemap.json --definitions=globalTypes.d.lua --definitions=testez.d.lua --base-luaurc=.luaurc --ignore=Packages/** --ignore=DevPackages/** tests/

format +files="src/":
	stylua src/ tests/

rojo-serve:
	rojo serve test.project.json
