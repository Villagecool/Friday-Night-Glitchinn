function onCreate()
	makeLuaSprite('snowFall', 'evilSnowfall', -5, -720);
	--setObjectCamera('snowFall', 'hud')
	setLuaSpriteScrollFactor('snowFall', 0, 0);
    addLuaSprite('snowFall', true);
	doTweenY('fallinSnow', 'snowFall', 0, 5, 'linear')
	doTweenX('fallinSnowX', 'snowFall', 5, 0.5, 'linear')
	makeLuaSprite('merry', 'merry', 0, 0)
	addLuaSprite('merry', true)
    scaleObject('merry', 1.2,1.2)
    screenCenter('merry', 'xy')
	setObjectCamera('merry', 'camOther')
	setProperty('merry.alpha', 0)

	
	makeAnimatedLuaSprite('up', 'croupterBop', -370, -120) 
	setLuaSpriteScrollFactor('up',0.33, 0.33);
	--addLuaSprite('up', false)
	addAnimationByPrefix('up','Move', 'Upper Crowd Bob Idle', 24, true);
end
function onTweenCompleted(t)
	if t == 'fallinSnow' then
		setProperty('snowFall.y', -720)
		doTweenY('fallinSnow', 'snowFall', 0, 5, 'linear')
	end
	if t == 'fallinSnowX' then
		doTweenX('fallinSnowX2', 'snowFall', -5, 0.5, 'linear')
	end
	if t == 'fallinSnowX2' then
		doTweenX('fallinSnowX', 'snowFall', 5, 0.5, 'linear')
	end
end
function onStepHit()
	if curStep == 611 then
    	doTweenAlpha('e', 'merry', 1, 1, 'linear')
	end
end