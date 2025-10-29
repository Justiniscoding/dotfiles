sbar.add("event", "aerospace_workspace_change")

-- TODO: Use ayu color scheme in here too

local workspaceItems = {}

sbar.exec("aerospace list-workspaces --all", function(list)
	local workspace_order = {}
	for w in list:gmatch("([^\r\n]+)") do
		table.insert(workspace_order, w)
	end

	local results = {}
	local pending = #workspace_order

	for i, space in ipairs(workspace_order) do
		sbar.exec(
			string.format(
				'aerospace list-windows --workspace %s --format "%%{monitor-appkit-nsscreen-screens-id}"',
				space
			),
			function(monitor)
				results[i] = {
					name = space,
					monitor = monitor,
				}
				pending = pending - 1

				if pending == 0 then
					for j, data in ipairs(results) do
						table.insert(
							workspaceItems,
							sbar.add("item", "workspace" .. data.name, {
								position = j,
								display = data.monitor,
								icon = {
									string = data.name,
									color = 0xff000000,
								},
							})
						)
					end

					sbar.add("item", "appSeparator", {
						position = #workspace_order + 1,
						label = { string = "|" },
					})
				end
			end
		)
	end
end)
