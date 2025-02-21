
function widget:GetInfo()
	return {
		name      = "Mex Snap",
		desc      = "Snaps mexes to give 100% metal",
		author    = "Niobium",
		version   = "v1.2",
		date      = "November 2010",
		license   = "GNU GPL, v2 or later",
		layer     = 1,
		enabled   = true,
		handler   = true
	}
end

local mapBlackList = { "Brazillian_Battlefield_Remake_V2"  }

local spGetActiveCommand = Spring.GetActiveCommand
local spGetMouseState = Spring.GetMouseState
local spTraceScreenRay = Spring.TraceScreenRay
local math_pi = math.pi
local preGamestartPlayer = Spring.GetGameFrame() == 0 and not Spring.GetSpectatingState()

local activeCmdID, bx, by, bz, bface
local unitshape

local isMex = {}
for uDefID, uDef in pairs(UnitDefs) do
	if uDef.extractsMetal > 0 then
		isMex[uDefID] = true
	end
end

local function GetClosestPosition(x, z, positions)
	local bestPos
	local bestDist = math.huge
	for i = 1, #positions do
		local pos = positions[i]
		if pos.x then
			local dx, dz = x - pos.x, z - pos.z
			local dist = dx * dx + dz * dz
			if dist < bestDist then
				bestPos = pos
				bestDist = dist
			end
		end
	end
	return bestPos
end

local function GiveNotifyingOrder(cmdID, cmdParams, cmdOpts)
	if widgetHandler:CommandNotify(cmdID, cmdParams, cmdOpts) then
		return
	end
	Spring.GiveOrder(cmdID, cmdParams, cmdOpts.coded)
end

local function DoLine(x1, y1, z1, x2, y2, z2)
	gl.Vertex(x1, y1, z1)
	gl.Vertex(x2, y2, z2)
end

local function clearShape()
	if unitshape then
		WG.StopDrawUnitShapeGL4(unitshape[6])
		unitshape = nil
	end
end

function widget:Initialize()
	if not WG.DrawUnitShapeGL4 then
		widgetHandler:RemoveWidget()
	end
	WG.MexSnap = {}
	if not WG['resource_spot_finder'] or not WG['resource_spot_finder'].metalSpotsList then
		Spring.Echo("<Snap Mex> This widget requires the 'Metalspot Finder' widget to run.")
		widgetHandler:RemoveWidget()
	end

	for _,value in ipairs(mapBlackList) do
		if Game.mapName == value then
			Spring.Echo("<Snap Mex> This map is incompatible - removing mex snap widget.")
			widgetHandler:RemoveWidget()
		end
	end
end

function widget:Shutdown()
	if WG.StopDrawUnitShapeGL4 then
		clearShape()
	end
end

function widget:GameStart()
	preGamestartPlayer = false
end

function widget:Update()
	if preGamestartPlayer then
		activeCmdID = WG['buildmenu'] and WG['buildmenu'].getPreGameDefID()
		if activeCmdID then activeCmdID = -activeCmdID end
	else
		_, activeCmdID = spGetActiveCommand()
	end

	if not (activeCmdID and isMex[-activeCmdID]) then
		WG.MexSnap.curPosition = nil
		return
	end

	-- Attempt to get position of command
	local mx, my = spGetMouseState()
	local _, pos = spTraceScreenRay(mx, my, true)
	if not pos then
		WG.MexSnap.curPosition = nil
		return
	end

	-- Find build position and check if it is valid (Would get 100% metal)
	bx, by, bz = Spring.Pos2BuildPos(-activeCmdID, pos[1], pos[2], pos[3])
	local closestSpot = GetClosestPosition(bx, bz, WG['resource_spot_finder'].metalSpotsList)
	if not closestSpot or WG['resource_spot_finder'].IsMexPositionValid(closestSpot, bx, bz) then
		WG.MexSnap.curPosition = nil
		return
	end

	-- Get the closet position that would give 100%
	bface = Spring.GetBuildFacing()
	local mexPositions = WG['resource_spot_finder'].GetBuildingPositions(closestSpot, -activeCmdID, bface, true)
	local bestPos = GetClosestPosition(bx, bz, mexPositions)
	if not bestPos then
		WG.MexSnap.curPosition = nil
		return
	end
	WG.MexSnap.curPosition = bestPos
end

function widget:DrawWorld()
	if not WG.DrawUnitShapeGL4 then
		widget:Shutdown()
		return
	end

	local bestPos = WG.MexSnap.curPosition

	if not bestPos then
		clearShape()

		return
	end

	-- Draw line
	gl.DepthTest(false)
	gl.LineWidth(1.49)
	gl.Color(1, 1, 0, 0.45)
	gl.BeginEnd(GL.LINE_STRIP, DoLine, bx, by, bz, bestPos.x, bestPos.y, bestPos.z)
	gl.LineWidth(1.0)
	gl.DepthTest(true)

	-- Add/update unit shape rendering
	local newUnitshape = {-activeCmdID, bestPos.x, bestPos.y, bestPos.z, bface}
	if not unitshape or (unitshape[1]~= newUnitshape[1] or unitshape[2]~= newUnitshape[2] or unitshape[3]~= newUnitshape[3] or unitshape[4]~= newUnitshape[4] or unitshape[5]~= newUnitshape[5]) then
		clearShape()
		unitshape = newUnitshape
		unitshape[6] = WG.DrawUnitShapeGL4(unitshape[1], unitshape[2], unitshape[3], unitshape[4], unitshape[5]*math_pi, 0.66, Spring.GetMyTeamID(), 0.15, 0.3)
	end
end

function widget:CommandNotify(cmdID, cmdParams, cmdOpts)
	if not isMex[-cmdID] then
		return
	end

	local cbx, cbz = cmdParams[1], cmdParams[3]
	local closestSpot = GetClosestPosition(bx, bz, WG['resource_spot_finder'].metalSpotsList)
	if closestSpot and not WG['resource_spot_finder'].IsMexPositionValid(closestSpot, cbx, cbz) then
		local cbface = cmdParams[4]
		local mexPositions = WG['resource_spot_finder'].GetBuildingPositions(closestSpot, -cmdID, cbface, true)
		local bestPos = GetClosestPosition(bx, bz, mexPositions)
		if bestPos then
			GiveNotifyingOrder(cmdID, {bestPos.x, bestPos.y, bestPos.z, bface}, cmdOpts)
			return true
		end
	end
end
