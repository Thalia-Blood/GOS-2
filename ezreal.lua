require('Inspired')

Menu = scriptConfig("Ezreal", "Ezreal script")
Menu.addParam("useq", "Use Q in combo", SCRIPT_PARAM_ONOFF, true)
Menu.addParam("usew", "Use W in combo", SCRIPT_PARAM_ONOFF, true)
Menu.addParam("user", "Use R if killable", SCRIPT_PARAM_ONOFF, true)
Menu.addParam("combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

local myHero = GetMyHero()

OnLoop(function(myHero)
	myHeroPos = GetOrigin(myHero)
	local target = GetCurrentTarget()
	if Menu.combo then 
	
	    	if CanUseSpell(myHero, _Q) == READY and Menu.useq then
			if ValidTarget(target, GetCastRange(myHero, _Q)) then
				local QPred = GetPredictionForPlayer(myHeroPos, target, GetMoveSpeed(target), 2000, 250, GetCastRange(myHero, _Q), 60, true, true)			
				if QPred.HitChance == 1 then
					CastSkillShot(_Q, QPred.PredPos.x, QPred.PredPos.y, QPred.PredPos.z)
				end
			end
		end
		
	    	if CanUseSpell(myHero, _W) == READY and Menu.usew then
			if ValidTarget(target, GetCastRange(myHero, _W)) then
				local WPred = GetPredictionForPlayer(myHeroPos, target, GetMoveSpeed(target), 1600, 250, GetCastRange(myHero, _Q), 80, false, true)			
				if WPred.HitChance == 1 then
					CastSkillShot(_W, WPred.PredPos.x, WPred.PredPos.y, WPred.PredPos.z)
				end
			end
		end
		
		if CanUseSpell(myHero, _R) == READY and Menu.user then
			if target ~= nil then 
				local RPred = GetPredictionForPlayer(myHeroPos, target, GetMoveSpeed(target), 2000, 1000, GetCastRange(myHero, _R), 160, false, true)			
				if RPred.HitChance == 1 and rmdg() > GetCurrentHP(target) then
					CastSkillShot(_R, RPred.PredPos.x, RPred.PredPos.y, RPred.PredPos.z)
				end
			end
		end
	end	
end)

function rmdg()
	if GetCastLevel(myHero, _R) == 0 then
		return 0
	end
	if GetCastLevel(myHero, _R) == 1 then
		return 350 + GetBonusDmg(myHero) + ((GetBonusAP(myHero)/100)*90)
	end
	if GetCastLevel(myHero, _R) == 2 then
		return 500 + GetBonusDmg(myHero) + ((GetBonusAP(myHero)/100)*90)
	end
	if GetCastLevel(myHero, _R) == 3 then
		return 650 + GetBonusDmg(myHero) + ((GetBonusAP(myHero)/100)*90)
	end
end
