require("Inspired")
Menu = scriptConfig("sterlingyi", "Sterling Yi")
	Menu.addParam("q", "Use Q in Combo", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("e", "Use E in Combo", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("r", "Use R in Combo", SCRIPT_PARAM_ONOFF, true)
	Menu.addParam("combo", "Combo Key", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

local myHero = GetMyHero()

OnLoop(function(myHero)
	if CanUseSpell(myHero, _Q) == READY and Menu.combo then
		target = GetCurrentTarget()
		if ValidTarget(target, 599) then CastTargetSpell(target, _Q) end
	end
end)

OnProcessSpell(function(unit, spell)
	if unit == myHero and Menu.combo and spell.name:find("Attack") then		
		if Menu.e and CanUseSpell(myHero, _E) == READY then CastTargetSpell(myHero, _E) end
		if Menu.r and CanUseSpell(myHero, _R) == READY then CastTargetSpell(myHero, _R) end		
	end
end)
