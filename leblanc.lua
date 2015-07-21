require('Inspired')

AddButton("Q", "Use [Q] in Combo", true)
AddButton("W", "Use [W] in Combo", true)
AddButton("E", "Use [E] in Combo", true)
AddButton("R", "Use [R] in Combo", true)
AddKey("Combo", "Do Combo", string.byte(" "))
AddKey("LastHit", "Do LastHit", string.byte("X"))
AddKey("LaneClear", "Do LaneClear", string.byte("V"))

AfterObjectLoopEvent(myHer0)
	DrawMenu()
	myHero = myHer0
	myHeroPos = GetOrigin(myHero)
	local target = GetCurrentTarget()
	if GetKeyValue("Combo") then
	
	    if CanUseSpell(myHero, _Q) == READY and GetButtonValue("Q") then
			if ValidTarget(target, GetCastRange(myHero, _Q)) then
				CastTargetSpell(target, _Q)
			end
		end
		
	    if CanUseSpell(myHero, _R) == READY and GetButtonValue("R") then
			if ValidTarget(target, GetCastRange(myHero, _R)) then
				CastTargetSpell(target, _R)
			end
		end
		
		if CanUseSpell(myHero, _W) == READY and GetButtonValue("W") and GetCastName(myHero, _W) ~= "leblancslidereturn" then
			if ValidTarget(target, GetCastRange(myHero, _W)) then
				local WPred = GetPredictionForPlayer(myHeroPos, target, GetMoveSpeed(target), 1500, 0, GetCastRange(myHero, _Q), 220, false, false)
				if WPred.HitChance == 1 then
					CastSkillShot(_W, WPred.PredPos.x, WPred.PredPos.y, WPred.PredPos.z)
				end
			end
		end
		
		if CanUseSpell(myHero, _E) == READY and GetButtonValue("E") then
			if ValidTarget(target, GetCastRange(myHero, _E-25)) then 
				local EPred = GetPredictionForPlayer(myHeroPos, target, GetMoveSpeed(target), 1600, 250, GetCastRange(myHero, _E), 70, true, true)				
				if EPred.HitChance == 1 then
					CastSkillShot(_E, EPred.PredPos.x, EPred.PredPos.y, EPred.PredPos.z)
				end
			end
		end
	end	
end
