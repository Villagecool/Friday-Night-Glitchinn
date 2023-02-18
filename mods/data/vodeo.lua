
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		startVideo('yoo is that day 1');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end