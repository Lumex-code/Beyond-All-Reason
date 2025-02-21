return {
	armcarry2 = {
		acceleration = 0.01722,
		activatewhenbuilt = true,
		brakerate = 0.01722,
		buildangle = 16384,
		buildcostenergy = 12000,
		buildcostmetal = 1400,
		--builder = true,
		buildpic = "ARMCARRY.DDS",
		buildtime = 20000,
		--canassist = false,
		--canattack = false,
		canmove = true,
		canreclaim = false,
		canrepair = false,
		category = "ALL NOTLAND MOBILE NOTSUB NOWEAPON SHIP NOTAIR NOTHOVER SURFACE EMPABLE",
		collisionvolumeoffsets = "-1 -7 2",
		collisionvolumescales = "64 64 159",
		collisionvolumetype = "CylZ",
		corpse = "DEAD",
		energymake = 300,
		energypershot = 7500,
		energystorage = 1500,
		energyuse = 25,
		explodeas = "minifusionExplosion",
		floater = true,
		footprintx = 7,
		footprintz = 7,
		icontype = "sea",
		idleautoheal = 15,
		idletime = 600,
		losemitheight = 56,
		mass = 10000,
		maxdamage = 5000,
		maxvelocity = 2.1,
		minwaterdepth = 15,
		movementclass = "BOAT8",
		nochasecategory = "VTOL",
		objectname = "Units/ARMCARRY2.s3o",
		radardistance = 2950,
		radaremitheight = 56,
		script = "Units/ARMCARRY2.cob",
		seismicsignature = 0,
		selfdestructas = "minifusionExplosion",
		sightdistance = 1105,
		sonardistance = 760,
		terraformspeed = 5000,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 180,
		waterline = 0,
		workertime = 1000,
		customparams = {
			unitgroup = 'antinuke',
			isairbase = true,
			model_author = "FireStorm",
			normaltex = "unittextures/Arm_normal.dds",
			subfolder = "armships/t2",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "-0.0550308227539 1.52587890767e-06 4.55026245117",
				collisionvolumescales = "61.8225860596 60.9250030518 154.450805664",
				collisionvolumetype = "Box",
				damage = 9168,
				energy = 0,
				featuredead = "HEAP",
				footprintx = 6,
				footprintz = 6,
				height = 4,
				hitdensity = 100,
				metal = 700,
				object = "Units/armcarry_dead.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 4032,
				energy = 0,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 350,
				object = "Units/arm6X6C.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:radarpulse_t2",
				[2] = "custom:waterwake-large",
				[3] = "custom:bowsplash-huge",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg2",
				[2] = "deathceg3",
				[3] = "deathceg4",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
			cant = {
				[1] = "cantdo4",
			},
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			ok = {
				[1] = "sharmmov",
			},
			select = {
				[1] = "sharmsel",
			},
		},
		weapondefs = {
			amd_rocket = {
				areaofeffect = 420,
				avoidfeature = false,
				avoidfriendly = false,
				burnblow = true,
				cegtag = "antimissiletrail",
				collidefriendly = false,
				coverage = 1600,
				craterareaofeffect = 420,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				energypershot = 7500,
				explosiongenerator = "custom:antinuke",
				firestarter = 100,
				flighttime = 20,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				interceptor = 1,
				metalpershot = 150,
				model = "fmdmissile.s3o",
				name = "ICBM intercepting missile launcher",
				noselfdamage = true,
				range = 72000,
				reloadtime = 2,
				smoketrail = true,
				smokePeriod = 10,
				smoketime = 110,
				smokesize = 27,
				smokecolor = 0.70,
				smokeTrailCastShadow = true,
				soundhit = "xplomed4",
				soundhitwet = "splslrg",
				soundstart = "antinukelaunch",
				stockpile = true,
				stockpiletime = 90,
				texture1 = "bluenovaexplo",
				texture2 = "smoketrailbar",
				texture3 = "null",
				tolerance = 7000,
				tracks = true,
				turnrate = 10000,
				weaponacceleration = 150,
				weapontimer = 2.5,
				weapontype = "StarburstLauncher",
				weaponvelocity = 6000,
				damage = {
					default = 1500,
				},
			},
			plasma = {
				areaofeffect = 4,
				avoidfeature = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "",--"custom:genericshellexplosion-medium",
				gravityaffected = "true",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				name = "HeavyCannon",
				noselfdamage = true,
				range = 1200,
				reloadtime = 2.5,
				size = 0,
				soundhit = "",--"xplomed2",
				soundhitwet = "",--"splssml",
				soundstart = "",--"cannhvy1",
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 360,
				damage = {
					default = 0,
				},
				customparams = {
					carried_unit = "armdrone",     --Name of the unit spawned by this carrier unit. 
					-- carried_unit2... 			Currently not implemented, but planned.
					engagementrange = 1200, 	
					spawns_surface = "SEA",    -- "LAND" or "SEA". The SEA option has not been tested currently. 
					spawnrate = 5, 				--Spawnrate roughly in seconds. 
					maxunits = 14,				--Will spawn units until this amount has been reached. 
					buildcostenergy = 1100,			--Custom spawn cost. Remove this or set = nil to inherit the cost from the carried_unit unitDef. Cost inheritance is currently not working. 
					buildcostmetal = 55,			--Custom spawn cost. Remove this or set = nil to inherit the cost from the carried_unit unitDef. Cost inheritance is currently not working. 
					controlradius = 1300,			--The spawned units should stay within this radius. Unfinished behavior may cause exceptions. Planned: radius = 0 to disable radius limit. 
					dockingarmor = 0.2,
					dockinghealrate = 20,
					docktohealthreshold = 50,
					enabledocking = true,		--If enabled, docking behavior is used. Currently docking while moving or stopping, and undocking while attacking. Unfinished behavior may cause exceptions.
					dockingHelperSpeed = 5,
					dockingpiecestart = 14,		--First model piece to be used for docking.
					dockingpieceinterval = 1,	--Number of pieces to skip when docking the next unit. 
					dockingpieceend = 27,		--Last model piece used for docking. Will loop back to first when exceeded. 
					dockingradius = 160,			--The range at which the units snap to the carrier unit when docking.
				}
			},
		},
		weapons = {
			--[2] = {
			--	badtargetcategory = "ALL",
			--	def = "AMD_ROCKET",
			--},
			[1] = {
				badtargetcategory = "VTOL",
				def = "PLASMA",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
