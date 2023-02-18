
local shakewind = false
function onCreate()
	
    OGX = getPropertyFromClass("openfl.Lib", "application.window.x")
    OGY = getPropertyFromClass("openfl.Lib", "application.window.y")
	CURRENT_X = getPropertyFromClass("openfl.Lib", "application.window.x")
	CURRENT_Y = getPropertyFromClass("openfl.Lib", "application.window.y")
	makeLuaSprite('simpi', 'prolouge/menu/simpi', 0, 1015)
	makeLuaSprite('simpi2', 'prolouge/menu/simpi-but-sus', 0, 0)
	makeLuaSprite('info', 'prolouge/menu/info', 1325, 0)
	makeLuaSprite('bg', 'prolouge/simpybg', 0, 0)
	--scaleObject('simpi', 0.9, 0.9)
	--scaleObject('info', 0.9, 0.9)
	scaleObject('bg', 5, 5)
	--screenCenter('simpi', 'xy')
	--screenCenter('info', 'xy')
	screenCenter('bg', 'xy')
	addLuaSprite('bg', true)
	addLuaSprite('simpi', true)
	addLuaSprite('simpi2', true)
	addLuaSprite('info', true)
	setObjectCamera('simpi', 'hud')
	setObjectCamera('simpi2', 'hud')
	setObjectCamera('info', 'hud')
	setObjectCamera('bg', 'hud')
	setProperty('simpi2.alpha',0)
	doTweenX('zoomi', 'bg.scale', 1, 0.5, 'quadInOut')
	doTweenY('zoomy', 'bg.scale', 1, 0.5, 'quadInOut')
	doTweenY('bounce', 'simpi', 10, 1, 'quadInOut')
		setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);
		playMusic('moosic', 1, true)
		setProperty('boyfriend.stunned', true)
		setProperty('botplayTxt.visible', false)
	--doTweenY('RYS0', 'simpi.scale', 0.65, 0.5, 'quadInOut')
end

local pause = false
local esc = true
function onSongStart()
	pause = true
	setProperty('boyfriend.stunned', false)
	if botplay then
		setProperty('botplayTxt.visible', true)
	end
	close(true)
end

local MR = false
function onUpdate(elapsed)
	if not allowCountdown and (keyReleased('space') or getPropertyFromClass('flixel.FlxG', 'keys.justReleased.ENTER')) and not startedCountdown then
		allowCountdown = true
		esc = false
		startCountdown()
		playSound('introGo-pixel')
		soundFadeOut('moosic', 1, 0)
		doTweenX('zoomw', 'bg.scale', 5, 0.5, 'quadInOut')
		doTweenY('zoomy', 'bg.scale', 5, 0.5, 'quadInOut')
		doTweenAngle('zoome', 'bg', 180, 0.5, 'quadInOut')
		cancelTween('bounce')
		cancelTween('ecnuoB')
		removeLuaSprite('simpi', true)
		setProperty('simpi2.alpha',1)
		doTweenY('cya', 'simpi2', 2000, 0.3, 'quadInOut')
		doTweenX('cya2', 'info', 2000, 0.3, 'quadInOut')
			makeLuaSprite('dark', '', 0, 0);
			makeGraphic('dark',1920,1080,'000000')
			addLuaSprite('dark', true);
			setObjectCamera('dark', 'other');
			setProperty('dark.scale.x',2)
			setProperty('dark.scale.y',2)
			setProperty('dark.alpha',0)
			doTweenAlpha('in','dark',1,0.5,'linear')
		setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
	end
	if (mouseReleased() and MR) then
		--makeLuaSprite('simpi', 'menu/simpi-gun', 0, 0)
		--setObjectCamera('simpi', 'hud')
		--addLuaSprite('simpi', true)
		--playSound('ak47')
		--runTimer('gun', 1.5)
		--runTimer('aaaaaaaaaa', 5)
	function onTimerCompleted(t)
		if t == 'gun' then
			shakewind = true
			triggerEvent('Screen Shake', '4.5, 1', '4.5, 1');
		end
		if t == 'aaaaaaaaaa' then
			addHaxeLibrary('Sys')
			runHaxeCode([[
				Sys.exit(0);
			]])
		end
	end
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justReleased.ESCAPE') and not esc and pause then
		esc = true
		pause = false
		endSong()
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justReleased.ESCAPE') and esc then
		pause = false
		esc = false
		playSound('cancelMenu')
		doTweenX('zoomw', 'bg.scale', 5, 0.5, 'quadInOut')
		doTweenY('leave', 'bg.scale', 5, 0.5, 'quadInOut')
		doTweenAngle('zoome', 'bg', -180, 0.5, 'quadInOut')
		removeLuaSprite('simpi', true)
		setProperty('simpi2.alpha',1)
		doTweenY('cya', 'simpi2', 2000, 0.3, 'quadInOut')
		doTweenX('cya2', 'info', 2000, 0.3, 'quadInOut')
	end
	if getMouseX('hud') > getProperty('simpi.x') and getMouseY('hud') > getProperty('simpi.y') and getMouseX('hud') < getProperty('simpi.x') + getProperty('simpi.width') and getMouseY('hud') < getProperty('simpi.y') + getProperty('simpi.height') and not startedCountdown then
		MR = true
		--scaleObject('simpi', 1.01, 1.01)
	else
		MR = false
		--scaleObject('simpi', 1, 1)
	end
	if shakewind == true then
		setPropertyFromClass("openfl.Lib", "application.window.x", OGX + math.random(-200,200))
		setPropertyFromClass("openfl.Lib", "application.window.y", OGY + math.random(-200,200))
	end
end

function onTweenCompleted(t)
	if t == 'zoomi' then
		doTweenX('e', 'info', 0, 0.6, 'quadInOut')
		doTweenY('simp', 'simpi', 0, 0.3, 'quadInOut')
	end
	if t == 'bounce' then
		doTweenY('ecnuoB', 'simpi', 0, 1, 'quadInOut')
	end
	if t == 'ecnuoB' then
		setProperty('simpi2.alpha',1)
		setProperty('simpi.alpha',0)
		doTweenY('oof', 'simpi', 0, 0.01, 'quadInOut')
	end
	if t == 'oof' then
		doTweenY('bounce', 'simpi', 10, 1, 'quadInOut')
		setProperty('simpi2.alpha',0)
		setProperty('simpi.alpha',1)
	end
	if t == 'in' then
		setProperty('boyfriend.stunned', FALSE)
		removeLuaSprite('simpi2', true)
		removeLuaSprite('info', true)
		removeLuaSprite('bg', true)
		close(true)
		doTweenAlpha('out','dark',0,0.5,'linear')
	end
	if t == 'leave' then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'tv');
		setProperty('health', -2)
		allowCountdown = true
		esc = false
	end
end

function onPause()
	if not pause then
		return Function_Stop
	end
	if esc then
		endSong()
	end
	return Function_Continue
end



function lerp(start, goal, alpha)
	return (start + ((goal - start) * alpha))
end