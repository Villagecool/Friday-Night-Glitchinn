function onCreate()
	-- background 
	makeLuaSprite('bgWalls2', 'christmas/evilBG', -600, -900);
	setLuaSpriteScrollFactor('bgWalls2', 0.2, 0.2);

    makeAnimatedLuaSprite('P', 'christmas/mall2/P', -300, 140) 
	setLuaSpriteScrollFactor('P',0.9, 0.9);
	
	makeAnimatedLuaSprite('up', 'mall2/up', -370, -120) 
	setLuaSpriteScrollFactor('up',0.33, 0.33);
	
	makeAnimatedLuaSprite('santa2', 'mall2/santa2', -800, 100) 
	setLuaSpriteScrollFactor('santa2', 1, 1);
	
	makeLuaSprite('christmasTree2', 'christmas/evilTreeRipGore', 390, -450);
	setLuaSpriteScrollFactor('christmasTree2', 0.40, 0.40);

	makeLuaSprite('snowFall', 'christmas/evilSnowfall', 0, 0);
	setObjectCamera('snowFall', 'hud')

	makeLuaSprite('fgSnow2', 'christmas/evilSnow', -730, 695);
	scaleObject('fgSnow2', 1.7,1.7)



	-- sprites that only load if Low Quality is turned off
	if not lowQuality then

	makeLuaSprite('bgEscalator2', 'bgEscalator2',  -1300, -670);
	setLuaSpriteScrollFactor('bgEscalator2', 0.3, 0.3);
		
	end

	addLuaSprite('bgWalls2', false);
	--addLuaSprite('up', false)
	addAnimationByPrefix('up','Move', 'Upper Crowd Bob Idle', 24, true);
    addLuaSprite('bgEscalator2', false);
	addLuaSprite('christmasTree2', false);
    addLuaSprite('fgSnow2', false);
    --addLuaSprite('P', false); --Added offscreen before it starts moving.
	addAnimationByPrefix('P', 'Move', 'Bottom Level Boppers Idle', 30, true);
	addAnimationByPrefix('P','Hey', 'Bottom Level Boppers HEY!!', 24, true);
	addLuaSprite('santa2', false); --Added offscreen before it starts moving.
	addAnimationByPrefix('santa2', 'Move', 'santa idle in fear', 30, true);

	
	doTweenY('fallinSnow', 'snowFall', 0, 5, 'quadInOut')
	 
	
 --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
function onTweenCompleted(t)
	if t == 'fallinSnow' then
		setProperty('snowFall.y', -720)
		doTweenY('fallinSnow', 'snowFall', 0, 5, 'quadInOut')
	end
end