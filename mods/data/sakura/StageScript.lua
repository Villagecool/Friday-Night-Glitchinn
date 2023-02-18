
local BlackTimer = 0
local StaticTimer = 0
local ShakeCamera = false
function onCreatePost()
    close(true)
end
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
		if v1 == 'Text' then
			makeLuaText('AAA', 'Someone Has Joined The Game', 0, getProperty('healthBarBG.x') - getProperty('healthBarBG.width') / 2, getProperty('healthBarBG.y') + 126)
			setTextSize('AAA', 39)
			setTextColor('AAA', 'FF0000')
			addLuaText('AAA')
			screenCenter('AAA', 'xy')
			setObjectCamera('AAA', 'hud')
			doTweenAlpha('SomoneJoined','AAA',0,1,'smootherInOut')
		end
		if v1 == 'Static' then
			setProperty('static.alpha',1)
			StaticTimer = v2
			doTweenAlpha('WaitOnStatic','static',1,StaticTimer,'smootherInOut')
		end
		if v1 == '0' then
			ShakeCamera = false
			setProperty('school-glitch.alpha',0)
			setProperty('school-orange.alpha',0)
			setProperty('school.alpha',1)

			doTweenColor('NormalBF', 'boyfriend', 'FFFFFF', 0.001, 'linear')
			doTweenColor('NormalDad', 'dad', 'FFFFF', 0.001, 'linear')
			doTweenColor('NormalSpearkers', 'gf', 'FFFFF', 0.001, 'linear')
			doTweenAlpha('FixAlphaDad', 'dad', 1, 0.001, 'linear')
			doTweenAlpha('FixAlphaGf', 'gf', 1, 0.001, 'linear')
		end
		if v1 == '2' then
			setProperty('school-glitch.alpha',1)
			setProperty('school-orange.alpha',0)
			setProperty('school.alpha',0)
		end
		if v1 == '1' then
			ShakeCamera = true
			doTweenColor('BlackBF', 'boyfriend', '000000', 0.1, 'linear')
			doTweenColor('BlackDad', 'dad', '000000', 0.1, 'linear')
			doTweenColor('orangeSpeakers', 'gf', '873E00', 0.1, 'linear')
			setProperty('school-glitch.alpha',0)
			setProperty('school-orange.alpha',1)
			setProperty('school.alpha',0)
		end
	end
end
function opponentNoteHit()
	if ShakeCamera then
		cameraShake('hud', 0.01, 0.1)
		cameraShake('game', 0.01, 0.1)
	end
end
function goodNoteHit()
	if ShakeCamera then
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