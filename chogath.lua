require('Inspired')

Menu = scriptConfig("cho", "Sterling Cho'Gath")
	Menu.addParam("Q", "Use Q in Combo", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("W", "Use W in Combo", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("R", "Use R in Combo", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("combo", "Combo Key", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

local myHero = GetMyHero()

OnLoop(function(myHero)
	myHeroPos = GetOrigin(myHero)
	local target = GetCurrentTarget()
	if Menu.combo then
	
		if CanUseSpell(myHero, _Q) == READY and Menu.Q then
			if ValidTarget(target, GetCastRange(myHero, _Q)) then
				local QPred = GetPredictionForPlayer(myHeroPos, target, GetMoveSpeed(target), math.huge, 1200, 950, 250, false, false)
				if QPred.HitChance == 1 then
					CastSkillShot(_Q, QPred.PredPos.x, QPred.PredPos.y, QPred.PredPos.z)
				end
			end
		end
		
		if CanUseSpell(myHero, _W) == READY and Menu.W then
			if ValidTarget(target, GetCastRange(myHero, _W)) then
				CastTargetSpell(target, _W)
			end				
		end
			
		if CanUseSpell(myHero, _R) == READY and Menu.R then
			if ValidTarget(target, GetCastRange(myHero, _R)) and rDmg() > GetCurrentHP(target) then 
				CastTargetSpell(target, _R)
			end
		end
	end	
end)

function rDmg()
	if GetCastLevel(myHero, _R) == 0 then
		return 0
	end
	if GetCastLevel(myHero, _R) == 1 then
		return 300 + ((GetBonusAP(myHero)/100)*70)
	end 
	if GetCastLevel(myHero, _R) == 2 then
		return 475 + ((GetBonusAP(myHero)/100)*70)
	end
	if GetCastLevel(myHero, _R) == 3 then
		return 650 + ((GetBonusAP(myHero)/100)*70)
	end	
end
