function onCreatePost()
	makeLuaSprite('torso', 'characters/corrupt torso', 200, 750);
	scaleObject('torso', 2, 2);
	setObjectCamera('torso', 'camHUD')
	setProperty('torso.alpha', 0);
    setObjectOrder('torso', 0)
	setProperty('torso.origin.y', getProperty('torso.height'))
end

function opponentNoteHit(id, direction, noteType, isSustainNote) --health drain by tord
	if  direction == 0 then
        setProperty('torso.angle',-3)
        setProperty('torso.scale.y',2.0)
	end
	if  direction == 1 then
        setProperty('torso.scale.y',2.05)
        setProperty('torso.angle',0)
	end
	if  direction == 2 then
        setProperty('torso.scale.y',1.95)
        setProperty('torso.angle',0)
	end
	if  direction == 3 then
        setProperty('torso.scale.y',2.0)
        setProperty('torso.angle',3)
	end
end
function onBeatHit()
	if getProperty('dad.animation.curAnim.name') == 'idle' then
	setProperty('torso.scale.y',2)
	setProperty('torso.angle',0)
	end
end