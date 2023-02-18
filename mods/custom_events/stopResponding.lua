local orignalName = 'n'
function onTimerCompleted(t)
    if t == 'waitToRespond' then 
        setPropertyFromClass("openfl.Lib", "application.window.title", orignalName)
		doTweenAlpha('ohship','white',0,0.2,'smootherInOut')
    end
end
function onCreate()
	orignalName = getPropertyFromClass('openfl.Lib', 'application.window.title')
end
function onEvent(name,value1,value2)
    if name == 'stopResponding' then
		makeLuaSprite('white', '', 0, 0);
		makeGraphic('white',1280,720,'FFFFFF')
		addLuaSprite('white', true);
		setObjectCamera('white', 'other')
		setLuaSpriteScrollFactor('white',0,0)
		setProperty('white.scale.x',2)
		setProperty('white.scale.y',2)
		setProperty('white.alpha',0)
		--setProperty('white.alpha',1)
		doTweenAlpha('ohship','white',0.5,0.2,'smootherInOut')
        orignalName = getPropertyFromClass("openfl.Lib", "application.window.title")
        setPropertyFromClass("openfl.Lib", "application.window.title", orignalName..' (Not Responding)')
        runTimer('waitToRespond', value1)
    end
end