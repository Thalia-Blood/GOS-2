require('Inspired')

Menu = scriptConfig("lb", "Sterling LeBlanc")
	Menu.addParam("Q", "Use Q in Combo", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("W", "Use W in Combo", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("E", "Use E in Combo", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("R", "Use R in Combo", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("combo", "Combo Key", SCRIPT_PARAM_KEYDOWN, string.byte(" "))
	
local myHero = GetMyHero()

OnLoop(function(myHero)
	myHeroPos = GetOrigin(myHero)
	local target = GetCurrentTarget()
	if Menu.combo then
	
	    	if CanUseSpell(myHero, _Q) == READY and Menu.Q then
			if ValidTarget(target, 700) then
				CastTargetSpell(target, _Q)
			end
		end
		
		 if CanUseSpell(myHero, _R) == READY and Menu.R then
			if ValidTarget(target, 700) then
				CastTargetSpell(target, _R)
			end
		end
		
		if CanUseSpell(myHero, _W) == READY and Menu.W and GetCastName(myHero, _W) ~= "leblancslidereturn" then
			if ValidTarget(target, 600) then
				local WPred = GetPredictionForPlayer(myHeroPos, target, GetMoveSpeed(target), 1500, 0, 600, 220, false, false)
				if WPred.HitChance == 1 then
					CastSkillShot(_W, WPred.PredPos.x, WPred.PredPos.y, WPred.PredPos.z)
				end
			end
		end
		
		if CanUseSpell(myHero, _E) == READY and Menu.E then
			if ValidTarget(target, 900) then 
				local EPred = GetPredictionForPlayer(myHeroPos, target, GetMoveSpeed(target), 1600, 250, 900, 70, true, true)				
				if EPred.HitChance == 1 then
					CastSkillShot(_E, EPred.PredPos.x, EPred.PredPos.y, EPred.PredPos.z)
				end
			end
		end
	end	
end)
