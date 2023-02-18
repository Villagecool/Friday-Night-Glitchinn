function onCreate()
	-- background shit
	makeLuaSprite('school', 'prolouge/lamo', -300, -540);
	setScrollFactor('school', 1, 1);
	scaleObject('school', 1.5, 1.5);

	addLuaSprite('school', false);
	
	makeLuaSprite('school2', 'prolouge/day2-background', -300, -540);
	setScrollFactor('school2', 1, 1);
	scaleObject('school2', 1.5, 1.5);

	setProperty('school2.alpha',0)
	addLuaSprite('school2', false);
end
local BlackTimer = 0
local StaticTimer = 0
local ShakeCameraBf = false
local ShakeCameraDad = false
function onEvent(n,v1,v2)
	if n == 'Change BG' then
		if v1 == 'Black' then
			BlackTimer = v2
			makeLuaSprite('flash', '', 0, 0);
			makeGraphic('flash',1280,720,'000000')
			addLuaSprite('flash', true);
			setLuaSpriteScrollFactor('flash',0,0)
			setProperty('flash.scale.x',2)
			setProperty('flash.scale.y',2)
			setProperty('flash.alpha',0)
			doTweenAlpha('flashIn','flash',1,BlackTimer/2,'smootherInOut')
		end
		if v1 == 'Flash' then
			makeLuaSprite('flash', '', 0, 0);
			makeGraphic('flash',1280,720,'FFFFFF')
			  addLuaSprite('flash', true);
			  setLuaSpriteScrollFactor('flash',0,0)
			  setProperty('flash.scale.x',2)
			  setProperty('flash.scale.y',2)
			  setProperty('flash.alpha',0)
			  setProperty('flash.alpha',1)
			doTweenAlpha('flTw','flash',0,1,'smootherInOut')
		end
		if v1 == 'Static' then
			setProperty('static.alpha',1)
			StaticTimer = v2
			doTweenAlpha('WaitOnStatic','static',1,StaticTimer,'smootherInOut')
		end
		if v1 == '0' then
			ShakeCameraDad = true
			setProperty('school2.alpha',1)
			setProperty('school.alpha',0)
		end
		if v1 == '2' then
			setProperty('school2.alpha',0)
			setProperty('school.alpha',1)
		end
	end
end
function onCreatePost()
	makeLuaSprite('vig', 'vig', 0, 0)
	addLuaSprite('vig', true)
	setObjectCamera('vig', 'camOther')
	setProperty('vig.alpha', 0)
	makeLuaSprite('vig2', 'vig', 0, 0)
	addLuaSprite('vig2', true)
	setObjectCamera('vig2', 'camOther')
	setProperty('vig2.alpha', 0)
	makeAnimatedLuaSprite('static', 'static', 0, 0)
	addAnimationByPrefix('static', 'idle', 'static', 24, true);
	addLuaSprite('static', true)
	setObjectCamera('static', 'camOther')
	setProperty('static.alpha', 0)
end
local bfCya = false
function bfGoByeBye()
	if mustHitSection and bfCya == false then
		setProperty('boyfriend.alpha', 0)
		makeLuaSprite('bfc', 'characters/cya', getProperty('boyfriend.x'), getProperty('boyfriend.y'))
		addLuaSprite('bfc', true)
		doTweenAlpha('cyabf','bfc',0,2,'smootherInOut')
		bfCya = true
	end
end

function opponentNoteHit()
	if ShakeCameraDad then
		cameraShake('hud', 0.001, 0.1)
		cameraShake('game', 0.001, 0.1)
	end
end
function goodNoteHit()
	if ShakeCameraBf then
		cameraShake('hud', 0.01, 0.1)
		cameraShake('game', 0.01, 0.1)
	end
end
function onTweenCompleted(t)
	if t == 'WaitOnStatic' then
		setProperty('static.alpha',0)
	end
	if t == 'flashIn' then
		doTweenAlpha('flashOut','flash',0,BlackTimer/2,'smootherInOut')
	end
	if t == 'SomoneJoined' then
		removeLuaSprite('AAA', true)
	end
end