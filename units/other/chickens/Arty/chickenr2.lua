return {
	chickenr2 = {
		acceleration = 1.15,
		bmcode = "1",
		brakerate = 9.2,
		buildcostenergy = 12320,
		buildcostmetal = 396,
		builder = false,
		buildpic = "chickens/chickenr2.DDS",
		buildtime = 270000,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = "1",
		capturable = false,
		category = "BOT MOBILE WEAPON ALL NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE CHICKEN EMPABLE",
		collisionvolumeoffsets = "0 -1 0",
		collisionvolumescales = "84 215 84",
		collisionvolumetest = 1,
		collisionvolumetype = "CylY",
		defaultmissiontype = "Standby",
		explodeas = "LOBBER_MORPH",
		footprintx = 4,
		footprintz = 4,
		hidedamage = 1,
		idleautoheal = 20,
		idletime = 300,
		leavetracks = true,
		maneuverleashlength = "640",
		mass = 40000,
		maxdamage = 8000,
		maxslope = 18,
		maxvelocity = 2.8,
		maxwaterdepth = 0,
		movementclass = "CHICKALLTERRAINBIG2HOVER",
		noautofire = false,
		nochasecategory = "VTOL",
		objectname = "Chickens/chicken_artillery_meteor_v2.s3o",
		script = "Chickens/chicken_artillery_xl_v2.cob",
		seismicsignature = 0,
		selfdestructas = "LOBBER_MORPH",
		side = "THUNDERBIRDS",
		sightdistance = 100,
		smoothanim = true,
		steeringmode = "2",
		tedclass = "BOT",
		trackoffset = 6,
		trackstrength = 3,
		trackstretch = 1,
		tracktype = "ChickenTrack",
		trackwidth = 100,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 600,
		unitname = "chickenr2",
		upright = false,
		waterline = 9999,
		workertime = 0,
		customparams = {
			subfolder = "other/chickens",
			model_author = "KDR_11k, Beherith",
			normalmaps = "yes",
			normaltex = "unittextures/chicken_l_normals.png",
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:blood_spray",
				[2] = "custom:blood_explode",
				[3] = "custom:dirt",
			},
			pieceexplosiongenerators = {
				[1] = "blood_spray",
				[2] = "blood_spray",
				[3] = "blood_spray",
			},
		},
		weapondefs = {
			goolauncher = {
				accuracy = 1024,
				areaofeffect = 256,
				collidefriendly = 0,
				collidefeature = 0,
				avoidfeature = 0,
				avoidfriendly = 0,
				burst = 1,
				burstrate = 0.5,
				cegtag = "blob_trail_red",
				collidefriendly = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.63,
				--explosiongenerator = "custom:ELECTRIC_EXPLOSION",
				explosiongenerator = "custom:genericshellexplosion-huge",
				impulseboost = 0,
				impulsefactor = 0.4,
				intensity = 0.7,
				interceptedbyshieldtype = 1,
				name = "GOOLAUNCHER",
				noselfdamage = true,
				proximitypriority = -4,
				range = 2000,
				reloadtime = 0.8,
				rgbcolor = "1 0.5 0.1",
				size = 5.5,
				sizedecay = 0.09,
				soundhit = "bombsmed2",
				soundstart = "bugarty",
				sprayangle = 1024,
				tolerance = 5000,
				turret = true,
				weapontimer = 0.2,
				weaponvelocity = 520,
				damage = {
					default = 3200,
					shields = 800,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "MOBILE",
				def = "GOOLAUNCHER",
				maindir = "0 0 1",
				maxangledif = 50,
				onlytargetcategory = "NOTAIR",
			},
		},
	},
}
