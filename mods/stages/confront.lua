
local pcname = os.getenv('USERNAME')
if pcname == 'gloga' then
	pcname = 'Villagecool'
end
	function onCreate()
		
	-- background shit
	makeLuaSprite('hand1', 'characters/corrupt-bf-hand', -200, 200);
	scaleObject('hand1', 2, 2);
	--setObjectCamera('hand1', 'camHUD')
    setScrollFactor('hand1', 0, 0)

	makeLuaSprite('corruptScreen', 'metalepsis/screen_corrupt', -600, 0);
	setObjectCamera('corruptScreen', 'camOther')

	makeLuaSprite('corruptScreen2', 'metalepsis/screen_corrupt', 600, 0);
	setProperty('corruptScreen2.flipX', true);
	setObjectCamera('corruptScreen2', 'camOther')

	makeLuaSprite('hand2', 'characters/corrupt-bf-hand', 1000, 200);
	scaleObject('hand2', 2, 2);
	setProperty('hand2.flipX', true);
    setScrollFactor('hand2', 0, 0)
	--setObjectCamera('hand2', 'camHUD');
end
function onCreatePost()
	
    makeLuaText('AAA', 'Misses: '..misses..'/10  ', 0, getProperty('healthBarBG.x') - getProperty('healthBarBG.width') / 2, getProperty('healthBarBG.y') + 26)
    setTextSize('AAA', 29)
    setTextBorder('AAA', 3, '000000')
    addLuaText('AAA')
    setObjectCamera('AAA', 'hud')

	addLuaSprite('hand1', true);
	addLuaSprite('hand2', true);
	addLuaSprite('torso', false);
	addLuaSprite('corruptScreen', true);
	addLuaSprite('corruptScreen2', true);
	--setObjectCamera('hand2', 'camHUD');
	setProperty('dad.alpha', 0);
	setProperty('hand2.alpha', 0);
	setProperty('hand1.alpha', 0)
	setProperty('boyfriend.visible', false);
	setProperty('gf.visible', false);
	setObjectCamera('dad', 'camHUD')
    setScrollFactor('dad', 0, 0)
    setScrollFactor('torso', 0, 0)
	--doTweenAlpha('w', 'hand1', 1, 5, 'CircInOut')
	--doTweenAlpha('s', 'hand2', 1, 5, 'CircInOut')

	
	setProperty('healthBar.visible', false)
	setProperty('healthBarBG.visible', false)
	setProperty('timeBarBG.visible', false)
	setProperty('timeBar.visible', false)
	setProperty('timeTxt.visible', false)
	setProperty('iconP1.visible', true)
	setProperty('iconP1.flipX', true)
	setProperty('iconP2.visible', false)
	setProperty('scoreTxt.alpha', 0)
	setObjectOrder('boyfriendGroup', 15)
	setObjectOrder('dadGroup', 0)
	--	if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
	--elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
	--	setPropertyFromClass('ClientPrefs', 'middleScroll', true);
	--end
	noteTweenX('lea123', 4, 412, 0.5, 'smootherStepOut')
	noteTweenX('dfsczvf', 5, 524, 0.5, 'smootherStepOut')
	noteTweenX('uvvxxxxv', 6, 636, 0.5, 'smootherStepOut')
	noteTweenX('rzxxxxxxxz', 7, 748, 0.5, 'smootherStepOut')
	noteTweenAlpha('leftnotegone', 0, 0, 0.000000001, 'smootherStepOut')
	noteTweenAlpha('downnotegone', 1, 0, 0.000000001, 'smootherStepOut')
	noteTweenAlpha('upnotegone', 2, 0, 0.000000001, 'smootherStepOut')
	noteTweenAlpha('rightnotegone', 3, 0, 0.000000001, 'smootherStepOut')
end
function onEvent()
	setProperty('gf.visible', false);
	setProperty('bf.visible', false);
end
function onTweenCompleted(tag)
	if tag == 'w' then
		doTweenAlpha('a', 'dad', 1, 1, 'CircInOut')
		--doTweenAlpha('g', 'torso', 1, 1, 'CircInOut')
	end
end
function onUpdate()
	setTextString('AAA', 'Misses: '..misses..'/10  ')
	if misses > 10 then
		setTextString('AAA', 'Misses: DEAD/10  ')
		setProperty('health', 0)
	end
end
function onUpdatePost()
	if curStep == 136 then
		doTweenAlpha('eedededed', 'hand1', 1, 0.5, 'CircInOut')
		doTweenAlpha('eedededeed', 'hand2', 1, 0.5, 'CircInOut')
		doTweenAlpha('eedeededeed', 'torso', 1, 0.5, 'CircInOut')
	end
	setProperty('iconP1.x', 50)
	setProperty('iconP1.y', getProperty('healthBarBG.y') - 106)
end
function setTransparency(color)
	local win = ffi.C.GetActiveWindow()
	if win == nil then
		debugPrint('Error finding window!!! idiot!!!!')
		debugPrint('cool code: '..tostring(ffi.C.GetLastError()))
	end
	if ffi.C.SetWindowLongA(win, -20, 0x00080000) == 0 then
		debugPrint('error setting window to be layed WTF DFOES THAT EVBEN MEAN LMAOOO!!! IM NOT NO NERD!')
		debugPrint('cool code: '..tostring(ffi.C.GetLastError()))
	end
	if ffi.C.SetLayeredWindowAttributes(win, color, 0, 0x00000001) == 0 then
		debugPrint('error setting color key or whatever')
		debugPrint('cool code: '..tostring(ffi.C.GetLastError()))
	end
end

function createHand()
    ffi = require('ffi')

    ffi.cdef[[
        typedef int BOOL;
        typedef int BYTE;
        typedef int LONG;
        typedef LONG DWORD;
        typedef DWORD COLORREF;
        typedef unsigned long HANDLE;
        typedef HANDLE HWND;
        typedef int bInvert;

        HWND GetActiveWindow(void);
        
        LONG SetWindowLongA(HWND hWnd, int nIndex, LONG dwNewLong);

        HWND SetLayeredWindowAttributes(HWND hwnd, COLORREF crKey, BYTE bAlpha, DWORD dwFlags);

        DWORD GetLastError();
    ]]
		addHaxeLibrary('Lib', 'openfl')
			addHaxeLibrary('Paths')
			addHaxeLibrary('Matrix', 'openfl.geom')
		 addHaxeLibrary('Rectangle', 'openfl.geom')
		 addHaxeLibrary('Sprite', 'openfl.display')
				runHaxeCode([[
					FlxG.mouse.useSystemCursor = true;
					var window = Lib.application.createWindow({
						x: 500,
						y: 500,
						width: 284,
						height: 234,
						title:'HAND.png',
						borderless: false,
						alwaysOnTop: true,
		
		
					});
		
					var bg = Paths.image("characters/corrupt-bf-hand").bitmap;
					var sprite = new Sprite();
		
					var m = new Matrix();
		
					sprite.graphics.beginBitmapFill(bg, m);
					sprite.graphics.drawRect(0, 0, bg.width*2, bg.height*2);
					sprite.graphics.beginFill(0x010101, 1);
					sprite.graphics.endFill();
					FlxG.mouse.useSystemCursor = true; 
					window.stage.addChild(sprite);
				]])
				setTransparency(0x00010101)
				runHaxeCode("Application.current.window.focus();")
end
function onSongStart()
	
	doTweenAlpha('a', 'dad', 1, 10, 'CircInOut')
end
function onEvent(n,v2,v2)
	if n == 'Kill Henchmen' then
		doTweenX('movemnt', 'corruptScreen', getProperty('corruptScreen.x' )+50, 0.5, 'CircInOut')
		doTweenX('movemnt2', 'corruptScreen2', getProperty('corruptScreen2.x' )-50, 0.5, 'CircInOut')
	end
end