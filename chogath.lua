require('Inspired')
require('IMenu')

AddButton("Q", "Use [Q] in Combo", true)
AddButton("W", "Use [W] in Combo", true)
AddButton("R", "Use [R] if Killable", true)
AddKey("Combo", "Do Combo", string.byte(" "))
AddKey("LastHit", "Do LastHit", string.byte("X"))
AddKey("LaneClear", "Do LaneClear", string.byte("V"))
	
AddAfterObjectLoopEvent(function(myHer0)
	DrawMenu()
	myHero = myHer0
	myHeroPos = GetOrigin(myHero)
	local target = GetCurrentTarget()
	if GetKeyValue("Combo") then
	
	    if CanUseSpell(myHero, _Q) == READY and GetButtonValue("Q") then
			if ValidTarget(target, GetCastRange(myHero, _Q)) then
				local QPred = GetPredictionForPlayer(myHeroPos, target, GetMoveSpeed(target), math.huge, 1200, 950, 250, false, false)
				if QPred.HitChance == 1 then
					CastSkillShot(_Q, QPred.PredPos.x, QPred.PredPos.y, QPred.PredPos.z)
				end
			end
		end
		
		if CanUseSpell(myHero, _W) == READY and GetButtonValue("W") then
			if ValidTarget(target, GetCastRange(myHero, _W)) then
				CastTargetSpell(target, _W)
			end				
		end
			
		if CanUseSpell(myHero, _R) == READY and GetButtonValue("R") then
			if ValidTarget(target, GetCastRange(myHero, _R)) and rDmg() > GetCurrentHP(target) then 
				CastTargetSpell(target, _R)
			end
		end
	end	
end)

function rDmg()
	if GetCastLevel(myHero, _R) < 1 then
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
