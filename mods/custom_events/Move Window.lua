tracking = true
function onEvent(name, value_1, value_2)
    if name == 'Move Window' then
		--doTweenWindow("x",value_1,1.5,"expoInOut")
		--doTweenWindow("Y",value_2,1.5,"expoInOut")
		doTweenX('tweenWind', 'camWindow', value_1, 1, 'linear')
		doTweenY('tweenWind2', 'camWindow', value_2, 1, 'linear')
    end
end
function onCreate()
    OGX = getPropertyFromClass("openfl.Lib", "application.window.x")
    OGY = getPropertyFromClass("openfl.Lib", "application.window.y")
    makeLuaText('camWindow', ' ' ,OGX, 0, OGY);
    setProperty('camWindow.x',OGX)
    setProperty('camWindow.y',OGY)
    addLuaText('camWindow')
	setObjectCamera('camWindow', 'camOther')
end
function onUpdate()
    if tracking == true then
	    setPropertyFromClass("openfl.Lib", "application.window.x", getProperty('camWindow.x'))
	    setPropertyFromClass("openfl.Lib", "application.window.y", getProperty('camWindow.y'))
    end
end
--function onUnpause()
--    setProperty('camWindow.x',getPropertyFromClass("openfl.Lib", "application.window.x"))
--    setProperty('camWindow.y',getPropertyFromClass("openfl.Lib", "application.window.y"))
--end
--function doTweenWindow(var,value,duration,ease)
--	runHaxeCode([[FlxTween.tween(Lib.application.window, {]]..var..[[: ]]..value..[[}, ]]..duration..[[, {ease: FlxEase.]]..ease..[[});]])
--end
function onDestroy()
    setPropertyFromClass("openfl.Lib", "application.window.x", OGX)
    setPropertyFromClass("openfl.Lib", "application.window.y", OGY)
end