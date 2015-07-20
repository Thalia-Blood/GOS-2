require('Inspired')
require('IMenu')
AddButton("Q", "Use [Q] in Combo", true)
AddButton("W", "Use [W] in Combo", true)
AddButton("R", "Use [R] if killable (Max 1000 range)", true)

function AfterObjectLoopEvent(myHer0)
	DrawMenu()
	myHero = myHer0
	myHeroPos = GetOrigin(myHero)
	local target = GetCurrentTarget()
	local rTarget = GetTarget(1000)
	if KeyIsDown(0x20) then 
	
	    if CanUseSpell(myHero, _Q) == READY and GetButtonValue("Q") then
			if ValidTarget(target, GetCastRange(myHero, _Q)) then
				local QPred = GetPredictionForPlayer(myHeroPos, target, GetMoveSpeed(target), 2000, 250, GetCastRange(myHero, _Q), 60, true, true)			
				if RPred.HitChance == 1 then
					CastSkillShot(_Q, QPred.PredPos.x, QPred.PredPos.y, QPred.PredPos.z)
				end
			end
		end
		
	    if CanUseSpell(myHero, _W) == READY and GetButtonValue("W") then
			if ValidTarget(target, GetCastRange(myHero, _W)) then
				local WPred = GetPredictionForPlayer(myHeroPos, target, GetMoveSpeed(target), 1600, 250, GetCastRange(myHero, _Q), 80, false, true)			
				if RPred.HitChance == 1 then
					CastSkillShot(_W, WPred.PredPos.x, WPred.PredPos.y, WPred.PredPos.z)
				end
			end
		end
		
		if CanUseSpell(myHero, _R) == READY and GetButtonValue("R") then
			if rTarget ~= nil then 
				local RPred = GetPredictionForPlayer(myHeroPos, rTarget, GetMoveSpeed(target), 2000, 1000, GetCastRange(myHero, _E), 160, false, true)			
				if RPred.HitChance == 1 and rmdg() > GetCurrentHP(rTarget) then
					CastSkillShot(_R, RPred.PredPos.x, RPred.PredPos.y, RPred.PredPos.z)
				end
			end
		end
	end	
end

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
