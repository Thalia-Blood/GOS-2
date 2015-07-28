if GetObjectName(GetMyHero()) == "Ashe" then
require("Inspired")

PrintChat(string.format("<font color='#ffff00'>Marxman loaded with </font><font color='#FFFFFF'>Ashe</font>"))

Menu = scriptConfig("mmashe", "Marxman: Ashe")
	Menu.addParam("Q", "Use Q in Low HP", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("W", "Use W in Combo", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("R", "Use R if Killable", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("combo", "Combo Key", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

local myHero = GetMyHero()
local SPEED_W, DELAY_W, RANGE_W, WIDTH_W = 1500, 250, 1200, 60
local SPEED_R, DELAY_R, RANGE_R, WIDTH_R = 1600, 250, 1000, 130

OnLoop(function(myHero)
	myPos = GetOrigin(myHero)
	targetPos = GetOrigin(target)
	target = GetCurrentTarget()

	if Menu.combo then

		if Menu.W then
			if CanUseSpell(myHero, _W) == READY and ValidTarget(target, RANGE_W) then
				WPred = GetPredictionForPlayer(myPos, target, GetMoveSpeed(target), SPEED_W, DELAY_W, RANGE_W, WIDTH_W, true, true)
				if WPred.HitChance == 1 then
					CastSkillShot(_W, WPred.PredPos.x, WPred.PredPos.y, WPred.PredPos.z)
				end
			end
		end

		if Menu.R then
			if CanUseSpell(myHero, _R) == READY and ValidTarget(target, RANGE_R) then
				RPred = GetPredictionForPlayer(myPos, target, GetMoveSpeed(target), SPEED_R, DELAY_R, RANGE_R, WIDTH_R, false, true)
				if RPred.HitChance == 1 and rdmg() > GetCurrentHP(target) then
					CastSkillShot(_R, RPred.PredPos.x, RPred.PredPos.y, RPred.PredPos.z)
				end
			end
		end
	end
end)

OnProcessSpell(function(unit, spell)
	if unit == myHero and spell.name:lower():find("attack") and Menu.combo and Menu.Q then
		for i = 0, 63 do
			if GetBuffName(myHero, i) == "asheqcastready" and GetBuffCount(myHero, i) == 5 and CanUseSpell(myHero, _Q) == READY then
				CastSpell(_Q)
			end
		end
	end
end)

function rdmg()
	if GetCastLevel(myHero, _R) == 0 then
		return 0
	elseif GetCastLevel(myHero, _R) == 1 then
		return 250 + GetBonusAP(myHero) - 150
	elseif GetCastLevel(myHero, _R) == 2 then
		return 425 + GetBonusAP(myHero) - 200
	elseif GetCastLevel(myHero, _R) == 3 then
		return 600 + GetBonusAP(myHero) - 250
	end
end
end

if GetObjectName(GetMyHero()) == "Ezreal" then
require('Inspired')

PrintChat(string.format("<font color='#ffff00'>Marxman loaded with </font><font color='#FFFFFF'>Ezreal</font>"))

Menu = scriptConfig("mmezreal", "Marxman: Ezreal")
	Menu.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("R", "Use R if Killable", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

local myHero = GetMyHero()

local SPEED_Q, DELAY_Q, RANGE_Q, WIDTH_Q = 2000, 250, 1200, 60
local SPEED_W, DELAY_W, RANGE_W, WIDTH_W = 1600, 250, 1050, 80
local SPEED_R, DELAY_R, RANGE_R, WIDTH_R = 2000, 1000, 20000, 160

local SPEED_Q
OnLoop(function(myHero)
	myPos = GetOrigin(myHero)
	local target = GetCurrentTarget()
	if Menu.combo then 
	
		if Menu.Q then
		    if CanUseSpell(myHero, _Q) == READY and ValidTarget(target, RANGE_Q) then
				local QPred = GetPredictionForPlayer(myPos, target, GetMoveSpeed(target), SPEED_Q, DELAY_Q, RANGE_Q, WIDTH_Q, true, true)			
				if QPred.HitChance == 1 then
					CastSkillShot(_Q, QPred.PredPos.x, QPred.PredPos.y, QPred.PredPos.z)
				end
			end
		end
		
		if Menu.W then
	   		if CanUseSpell(myHero, _W) == READY and ValidTarget(target, RANGE_W) then
				local WPred = GetPredictionForPlayer(myPos, target, GetMoveSpeed(target), SPEED_W, DELAY_W, RANGE_W, WIDTH_W, false, false)			
				if WPred.HitChance == 1 then
					CastSkillShot(_W, WPred.PredPos.x, WPred.PredPos.y, WPred.PredPos.z)
				end
			end
		end
		
		if Menu.R then
			if CanUseSpell(myHero, _R) == READY and ValidTarget(target, 1500) then
				local RPred = GetPredictionForPlayer(myPos, target, GetMoveSpeed(target), SPEED_R, DELAY_R, RANGE_R, WIDTH_R, false, false)			
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
		return 350 + GetBonusDmg(myHero) + ((GetBonusAP(myHero)/100)*90) - 150
	end
	if GetCastLevel(myHero, _R) == 2 then
		return 500 + GetBonusDmg(myHero) + ((GetBonusAP(myHero)/100)*90) - 200
	end
	if GetCastLevel(myHero, _R) == 3 then
		return 650 + GetBonusDmg(myHero) + ((GetBonusAP(myHero)/100)*90) - 250
	end
end
end

if GetObjectName(GetMyHero()) == "Graves" then
require("Inspired")

PrintChat(string.format("<font color='#ffff00'>Marxman loaded with </font><font color='#FFFFFF'>Graves</font>"))
Menu = scriptConfig("mmgraves", "Marxman: Graves")
	Menu.addParam("Q", "Use Q in Combo", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("W", "Use W in Combo", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("E", "Use E in Combo", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("R", "Use R if Killable", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("combo", "Combo Key", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

local myHero = GetMyHero()
local SPEED_Q, DELAY_Q, RANGE_Q, WIDTH_Q = 2000, 250, 1000, 50
local SPEED_R, DELAY_R, RANGE_R, WIDTH_R = 2100, 250, 1100, 100

OnLoop(function(myHero)
	myPos = GetOrigin(myHero)
	targetPos = GetOrigin(target)
	myHero = GetMyHero()
	target = GetCurrentTarget()
	mousePos = GetMousePos()

	if Menu.combo then
		if Menu.Q then
			if CanUseSpell(myHero, _Q) == READY and ValidTarget(target, 1000) then
				QPred = GetPredictionForPlayer(myPos, target, GetMoveSpeed(target), SPEED_Q, DELAY_Q, RANGE_Q, WIDTH_Q, false, false)
				if QPred.HitChance == 1 then
					CastSkillShot(_Q, QPred.PredPos.x, QPred.PredPos.y, QPred.PredPos.z)
				end
			end
		end

		if Menu.W then
			if CanUseSpell(myHero, _W) == READY and ValidTarget(target, 1100) then
				CastSkillShot(_W, targetPos.x, targetPos.y, targetPos.z)
			end
		end

		if Menu.E then
			if CanUseSpell(myHero, _W) == READY and ValidTarget(target, 950) then
				CastSkillShot(_E, mousePos.x, mousePos.y, mousePos.z)
			end
		end

		if Menu.R then
			if CanUseSpell(myHero, _R) == READY and ValidTarget(target, 1700) then
				RPred = GetPredictionForPlayer(myPos, target, GetMoveSpeed(target), SPEED_R, DELAY_R, RANGE_R, WIDTH_R, false, false)
				if RPred.HitChance == 1 and rdmg() > GetCurrentHP(target) then
					CastSkillShot(_R, RPred.PredPos.x, RPred.PredPos.y, RPred.PredPos.z)
				end
			end
		end
	end
end)

function rdmg()
	if GetCastLevel(myHero, _R) == 0 then
		return 0
	elseif GetCastLevel(myHero, _R) == 1 then
		return 250 + (GetBonusDmg(myHero) * 1.5) - 150
	elseif GetCastLevel(myHero, _R) == 2 then
		return 400 + (GetBonusDmg(myHero) * 1.5) - 200
	elseif GetCastLevel(myHero, _R) == 3 then
		return 550 + (GetBonusDmg(myHero) * 1.5) - 250
	end
end
end

if GetObjectName(GetMyHero()) == "Jinx" then
require("Inspired")

PrintChat(string.format("<font color='#ffff00'>Marxman loaded with </font><font color='#FFFFFF'>Jinx</font>"))

Menu = scriptConfig("mmjinx", "Marxman: Jinx")
	Menu.addParam("Q", "Q Logic", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("W", "Use W in Combo", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("E", "Use E in Combo", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("combo", "Combo Key", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

local myHero = GetMyHero()
local SPEED_W, DELAY_W, RANGE_W, WIDTH_W = 3300, 600, 1500, 60

OnLoop(function(myHero)
	target = GetCurrentTarget()
	myRange = GetRange(myHero)
	myPos = GetOrigin(myHero)
	targetPos = GetOrigin(target)

	if Menu.combo then
		if Menu.Q then
			if myRange == 525 and GetDistance(target) > 525 and CanUseSpell(myHero, _Q) == READY then
				CastSpell(_Q)
			end 
			if myRange > 525 and GetDistance(target) < 525 and CanUseSpell(myHero, _Q) == READY then
				CastSpell(_Q)
			end
		end

		if Menu.W then
			if CanUseSpell(myHero, _W) == READY and ValidTarget(target, 1500) then
				local WPred = GetPredictionForPlayer(myPos, target, GetMoveSpeed(target), SPEED_W, DELAY_W, RANGE_W, WIDTH_W, true, true)
				if WPred.HitChance == 1 then
					CastSkillShot(_W, WPred.PredPos.x, WPred.PredPos.y, WPred.PredPos.z)
				end
			end
		end

		if Menu.E then
			if CanUseSpell(myHero, _E) == READY and ValidTarget(target, 800) then
				CastSkillShot(_E, targetPos.x, targetPos.y, targetPos.z)
			end
		end
	end
end)
end

if GetObjectName(GetMyHero()) == "MissFortune" then
require("Inspired")

PrintChat(string.format("<font color='#ffff00'>Marxman loaded with </font><font color='#FFFFFF'>MissFortune</font>"))

Menu = scriptConfig("mmmf", "Marxman: MissFortune")
	Menu.addParam("Q", "Use Q in Combo", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("W", "Use W in Combo", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("E", "Use E in Combo", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("combo", "Combo Key", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

local myHero = GetMyHero()
local target = GetCurrentTarget()
local SPEED_E, DELAY_E, RANGE_E, WIDTH_E = math.huge, 100, 800, 50

OnLoop(function(myHero)
	myPos = GetOrigin(myHero)
	myHero = GetMyHero()
	target = GetCurrentTarget()

	if Menu.combo then
		if Menu.Q then
			if CanUseSpell(myHero, _Q) == READY and ValidTarget(target, 650) then
				CastTargetSpell(target, _Q)
			end
		end

		if Menu.E then
			if CanUseSpell(myHero, _E) == READY and ValidTarget(target, RANGE_E) then
				EPred = GetPredictionForPlayer(myPos, target, GetMoveSpeed(target), SPEED_E, DELAY_E, RANGE_E, WIDTH_E, false, false)
				if EPred.HitChance == 1 then
					CastSkillShot(_E, EPred.PredPos.x, EPred.PredPos.y, EPred.PredPos.z)
				end
			end
		end
	end
end)

OnProcessSpell(function(unit, spell)
	if unit == myHero and spell.name:lower():find("attack") and Menu.W and Menu.combo then
		if CanUseSpell(myHero, _W) == READY then CastSpell(_W) end
	end
end)
end

if GetObjectName(GetMyHero()) == "Quinn" then
require("Inspired")

PrintChat(string.format("<font color='#ffff00'>Marxman loaded with </font><font color='#FFFFFF'>Quinn</font>"))

Menu = scriptConfig("mmquinn", "Marxman: Quinn")
	Menu.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("combo", "Combo Key", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

local SPEED_Q, DELAY_Q, RANGE_Q, WIDTH_Q = 1550, 250, 1050, 80

OnLoop(function(myHero)

	target = GetCurrentTarget()
	myPos = GetOrigin(myHero)
	myHero = GetMyHero()

	if Menu.combo then
		if Menu.Q then
			if CanUseSpell(myHero, _Q) == READY and ValidTarget(target, RANGE_Q) then
				QPred = GetPredictionForPlayer(myPos, target, GetMoveSpeed(target), SPEED_Q, DELAY_Q, RANGE_Q, WIDTH_Q, true, true)
				if QPred.HitChance == 1 then
					CastSkillShot(_Q, QPred.PredPos.x, QPred.PredPos.y, QPred.PredPos.z)
				end
			end
		end

		if Menu.E then
			if CanUseSpell(myHero, _E) == READY and ValidTarget(target, 700) then
				CastTargetSpell(target, _E)
			end
		end
	end
end)
end

if GetObjectName(GetMyHero()) == "Sivir" then
require("Inspired")

PrintChat(string.format("<font color='#ffff00'>Marxman loaded with </font><font color='#FFFFFF'>Sivir</font>"))

Menu = scriptConfig("mmquinn", "Marxman: Sivir")
	Menu.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("combo", "Combo Key", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

local SPEED_Q, DELAY_Q, RANGE_Q, WIDTH_Q = 1550, 250, 1250, 90
local myHero = GetMyHero()

OnLoop(function(myHero)
	target = GetCurrentTarget()
	myPos = GetOrigin(myHero)

	if Menu.combo then
		if Menu.Q then
			if CanUseSpell(myHero, _Q) == READY and ValidTarget(target, RANGE_Q) then
				QPred = GetPredictionForPlayer(myPos, target, GetMoveSpeed(target), SPEED_Q, DELAY_Q, RANGE_Q, WIDTH_Q, false, false)
				if QPred.HitChance == 1 then
					CastSkillShot(_Q, QPred.PredPos.x, QPred.PredPos.y, QPred.PredPos.z)
				end
			end
		end
	end
end)

OnProcessSpell(function(unit, spell)
	if unit == myHero and spell.name:lower():find("attack") and Menu.combo and Menu.W then
		if CanUseSpell(myHero, _W) then
			CastSpell(_W)
		end
	end
end)
end

if GetObjectName(GetMyHero()) == "Tristana" then
require("Inspired")

PrintChat(string.format("<font color='#ffff00'>Marxman loaded with </font><font color='#FFFFFF'>Tristana</font>"))

Menu = scriptConfig("mmtristana", "Marxman: Tristana")
	Menu.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("combo", "Combo Key", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

local SPEED_W, DELAY_W, RANGE_W, WIDTH_W = 1500, 500, 900, 270
local myHero = GetMyHero()

OnLoop(function(myHero)
	target = GetCurrentTarget()
	myPos = GetOrigin(myHero)

	if Menu.combo then
		if Menu.W then
			if CanUseSpell(myHero, _W) == READY and ValidTarget(target, RANGE_W) then
				WPred = GetPredictionForPlayer(myPos, target, GetMoveSpeed(target), SPEED_W, DELAY_W, RANGE_W, WIDTH_W, false, false)
				if WPred.HitChance == 1 then
					CastSkillShot(_W, WPred.PredPos.x, WPred.PredPos.y, WPred.PredPos.z)
				end
			end
		end

		if Menu.E then
			if CanUseSpell(myHero, _E) == READY and ValidTarget(target, eRange()) then
				CastTargetSpell(target, _E)
			end
		end

		if Menu.R then
			if CanUseSpell(myHero, _R) == READY and ValidTarget(target, eRange()) and rDmg() > GetCurrentHP(target) then
				CastTargetSpell(target, _R)
			end
		end
	end
end)

OnProcessSpell(function(unit, spell)
	if unit == myHero and spell.name:lower():find("attack") and Menu.combo and Menu.Q then
		if CanUseSpell(myHero, _Q) then
			CastSpell(_Q)
		end
	end
end)

function eRange()
	return 543 + (7 * GetLevel(myHero))
end

function rDmg()
	if GetCastLevel(myHero, _R) == 0 then
		return 0
	elseif GetCastLevel(myHero, _R) == 1 then
		return 300 + GetBonusAP(myHero) - 150
	elseif GetCastLevel(myHero, _R) == 2 then
		return 400 + GetBonusAP(myHero) - 200
	elseif GetCastLevel(myHero, _R) == 3 then
		return 500 + GetBonusAP(myHero) - 250
	end
end
end
