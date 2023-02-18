function onCreate()
	-- background shit
	makeLuaSprite('bg', 'ow', -300, -440);
	setScrollFactor('bg', 1, 1);
	scaleObject('bg', 2, 2);

	addLuaSprite('bg', false);

end
function opponentNoteHit()
	triggerEvent('Play Animation', 'hit', 'boyfriend')
end