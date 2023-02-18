function onCreate()
	makeLuaSprite('bluescreen', 'bluescreen', 0, 0)
	addLuaSprite('bluescreen', true)
	setObjectCamera('bluescreen', 'camOther')
	setProperty('bluescreen.visible', false)
    freez = false
end
function onEvent(name, value_1, value_2)
    if name == 'Bluescreen' then
        freez = true
        --setUp
	makeLuaSprite('bluescreen', 'bluescreen', 0, 0)
	addLuaSprite('bluescreen', true)
	setObjectCamera('bluescreen', 'camOther')
	setProperty('bluescreen.visible', true)
        CURRENT_X = getPropertyFromClass("openfl.Lib", "application.window.x")
        CURRENT_Y = getPropertyFromClass("openfl.Lib", "application.window.y")
        --Start
		playSound('blue-screen', 1, 'blue-screen')
        setPropertyFromClass("openfl.Lib", "application.window.x", 0)
        setPropertyFromClass("openfl.Lib", "application.window.y", 0)
        setPropertyFromClass("openfl.Lib", "application.window.fullscreen", true)
        runTimer('lamo', value_1-2)
        runTimer('Go_Back', value_1)
        if value_2 == '1' then
            runTimer('Crash', value_1+0.1)
        end
		setProperty('vocals.volume', 0)
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
    end
end
function onTimerCompleted(tag)
    if tag == 'lamo' then
        makeLuaSprite('bluescreen', 'bluescreenbut L', 0, 0)
        addLuaSprite('bluescreen', true)
        setObjectCamera('bluescreen', 'camOther')
    end
    if tag == 'Go_Back' then
        freez = false
		setProperty('vocals.volume', 1)
        setProperty('bluescreen.visible', false)
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
        setPropertyFromClass("openfl.Lib", "application.window.fullscreen", false)
        setPropertyFromClass("openfl.Lib", "application.window.x", CURRENT_X)
        setPropertyFromClass("openfl.Lib", "application.window.y", CURRENT_Y)
    end
    if tag == 'Crash' then
			addHaxeLibrary('Sys')
			runHaxeCode([[
				Sys.exit(0);
			]])
    end
end
function onUpdatePost(elapsed)
    if freez == true then
		setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition') - elapsed * 1000  ) -- it is counted by milliseconds, 1000 = 1 second
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
		setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
    end
end