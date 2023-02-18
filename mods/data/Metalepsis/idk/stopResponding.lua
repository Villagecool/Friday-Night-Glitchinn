OrignalName = 0
function onEvent(n,v1,v2)
    if n == 'stopResonding' then
		makeLuaSprite('white', '', 0, 0);
		makeGraphic('white',1280,720,'FFFFFF')
		addLuaSprite('white', true);
		setLuaSpriteScrollFactor('white',0,0)
		setProperty('white.scale.x',2)
		setProperty('white.scale.y',2)
		setProperty('white.alpha',0)
		setProperty('white.alpha',1)
		doTweenAlpha('ohship','white',1,0.2,'smootherInOut')
        OrignalName = getPropertyFromClass("openfl.Lib", "application.window.title")
        setPropertyFromClass("openfl.Lib", "application.window.title", getPropertyFromClass("openfl.Lib", "application.window.title")..' (Not Responding)')
        runTimer('waitToRespond', v1)
    end
end
function onTimerCompleted(t)
    if t == 'waitToRespond' then 
        setPropertyFromClass("openfl.Lib", "application.window.title", OrignalName)
    end
end