
local pcname = os.getenv('USERNAME')
local ffi = require("ffi")
-- replace 0x00000000 with whatever color i dont care
--02FF02
--0C0C0C
--0D0A0D
ffi.cdef([[
	enum{
		COLOR_REF = 0xFF0D0A0D
	};

	typedef void* HWND;

	typedef int BOOL;

	typedef unsigned char BYTE;
	typedef unsigned long DWORD;
	typedef DWORD COLORREF;

	HWND GetActiveWindow();

	long SetWindowLongA(HWND hWnd, int nIndex, long dwNewLong);

	BOOL SetLayeredWindowAttributes(HWND hwnd, COLORREF crKey, BYTE bAlpha, DWORD dwFlags);
]])

function transWindow()
    makeLuaSprite('greenscreen', 'metalepsis/greenscreen', -300, -300);
    setScrollFactor('greenscreen', 0, 0);
    scaleObject('greenscreen', 3, 3);
    addLuaSprite('greenscreen', false);
    
    local hwnd = ffi.C.GetActiveWindow()
        
    if ffi.C.SetWindowLongA(hwnd, -20, 0x00080000) ~= 0 then
        ffi.C.SetLayeredWindowAttributes(hwnd, ffi.C.COLOR_REF, 0, 0x00000001) 
    end
end
function onCreate()
    --setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Your Screwedin\': Good luck '.. pcname..'!')
    setPropertyFromClass("openfl.Lib", "application.window.title"," ")
    OGX = getPropertyFromClass("openfl.Lib", "application.window.x")
    OGY = getPropertyFromClass("openfl.Lib", "application.window.y")
    makeLuaText('camWindow', ' ' ,OGX, 0, OGY);
    setProperty('camWindow.x',OGX)
    setProperty('camWindow.y',OGY)
    addLuaText('camWindow')
	setObjectCamera('camWindow', 'camOther')
end
function onUnpause()
    setProperty('camWindow.x',getPropertyFromClass("openfl.Lib", "application.window.x"))
    setProperty('camWindow.y',getPropertyFromClass("openfl.Lib", "application.window.y"))
end
fr = 0
function onSongStart()
	for i = 0, getProperty('opponentStrums.length')-1 do		
        setPropertyFromGroup('opponentStrums',i,'visible',false)	
        setPropertyFromGroup('opponentStrums',i,'x',99999)
end
	setPropertyFromClass("openfl.Lib", "application.window.alwaysOnTop",true)
end
function onUpdate(elapsed)
    fr = fr + elapsed
    bruhy = (170 + math.sin(fr*1.85) * 100)
    bruhx = (OGX + math.sin(fr*0.7) * 300)
    if curStep > 451 and curStep < 992 then
        --setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin\': ERROR')
    --setPropertyFromClass("openfl.Lib", "application.window.x", bruhx)
    --setPropertyFromClass("openfl.Lib", "application.window.y", bruhy)
    --setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin\': RORRE')
    end
    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, 'visible', false)
    end
    if getPropertyFromClass("openfl.Lib", "application.window.fullscreen") then
        setProperty('camHUD.zoom', 0.67)
    end
    if curStep == 384 then
        --992
        
            CURX = getPropertyFromClass("openfl.Lib", "application.window.x")
            CURY = getPropertyFromClass("openfl.Lib", "application.window.y")
            --for i = 4,7 do
            --    setPropertyFromGroup('strumLineNotes', i, 'scale.x', getPropertyFromGroup('strumLineNotes', i, 'scale.x')*0.87)
            --    setPropertyFromGroup('strumLineNotes', i, 'scale.y', getPropertyFromGroup('strumLineNotes', i, 'scale.y')*0.87)
		    --	noteTweenX('note'..i..'TwnX', i, CURX+(110*0.67*i)-220*0.67, 0.5, 'quadInOut');
		    --	noteTweenY('note'..i..'TwnY', i, CURY, 0.5, 'quadInOut');
            --end
            setProperty('camHUD.zoom', 0.67)
            setPropertyFromClass("openfl.Lib", "application.window.fullscreen",true)
	    setProperty('fpsVar.visible', false)
        setPropertyFromClass("openfl.Lib", "application.window.borderless",true)


        makeLuaSprite('fakeWindow', 'metalepsis/fnfBar1', CURX*0.67, CURY*0.67);
        scaleObject('fakeWindow', 0.67, 0.67);
        setObjectCamera('fakeWindow', 'camOther')
        addLuaSprite('fakeWindow', true);
        doTweenY('DieWindow', 'fakeWindow', 2000, 1.5, 'CircInOut')
        doTweenAngle('DieWindowR', 'fakeWindow', -90, 1.5, 'CircInOut')
        makeLuaSprite('fakeWindow2', 'metalepsis/fnfBar2', CURX*0.67, CURY*0.67);
        scaleObject('fakeWindow2', 0.67, 0.67);
        setObjectCamera('fakeWindow2', 'camOther')
        addLuaSprite('fakeWindow2', true);
        doTweenY('DieWindow2', 'fakeWindow2', 2000, 1.5, 'CircInOut')
        doTweenAngle('DieWindowR2', 'fakeWindow2', 90, 1.5, 'CircInOut')
	    --setProperty('hand1.visible', false)
	    --setProperty('hand2.visible', false)
	    --setPropertyFromClass("openfl.Lib", "application.window.borderless",true)
	    --setPropertyFromClass("openfl.Lib", "application.window.fullscreen",true)
	    setProperty('camHUD.scale.x', 0.5)
	    setProperty('camHUD.scale.y', 0.5)
        setPropertyFromClass("openfl.Lib", "application.window.x", OGX)
        setPropertyFromClass("openfl.Lib", "application.window.y", OGY)
        transWindow()
    end
    if curStep == 385 then
        setPropertyFromClass("openfl.Lib", "application.window.fullscreen",true)
    end
    --if curStep == 2274 then
    --    setPropertyFromClass("openfl.Lib", "application.window.fullscreen",false)
    --end
    
    --if curStep > 2274 and curStep < 2896 then
	--	for i = 4, 7 do
	--		noteTweenX('note'..i..'TwnX', i, bruhx*2/2-300+(110*i), 0.001, 'quadInOut');
	--		noteTweenY('note'..i..'TwnY', i, bruhy*2, 0.001/2, 'quadInOut');
	--	end
    --    setPropertyFromClass("openfl.Lib", "application.window.x", bruhx*2-200)
    --    setPropertyFromClass("openfl.Lib", "application.window.y", bruhy*2-200)
    --    end
    --if curStep == 2896 then
    --    --setPropertyFromClass("openfl.Lib", "application.window.y", -200000)
	--	triggerEvent('Bluescreen', '5', '');
    --end
    --if curStep == 2906 then
    --    --setPropertyFromClass("openfl.Lib", "application.window.y", 0)
    --end
end

function onDestroy()
    
	setPropertyFromClass("openfl.Lib", "application.window.fullscreen",false)
	setPropertyFromClass("openfl.Lib", "application.window.borderless",false)
	setPropertyFromClass("openfl.Lib", "application.window.alwaysOnTop",false)
    setPropertyFromClass("openfl.Lib", "application.window.x", OGX)
    setPropertyFromClass("openfl.Lib", "application.window.y", OGY)
    setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin\': Psych Engine')
end
function spinNotes()
    noteTweenAngle('rotnote1',4,90,0.5,'expoOut')
    noteTweenAngle('rotnote2',5,90,0.5,'expoOut')
    noteTweenAngle('rotnote3',6,90,0.5,'expoOut')
    noteTweenAngle('rotnote4',7,90,0.5,'expoOut')
    function onTweenCompleted(t)
        if t == 'rotnote1' then
            noteTweenAngle('rottnote1',4,0,0.001,'expoOut')
            noteTweenAngle('rottnote2',5,0,0.001,'expoOut')
            noteTweenAngle('rottnote3',6,0,0.001,'expoOut')
            noteTweenAngle('rottnote4',7,0,0.001,'expoOut')
            noteTweenX('altnote1',4,defaultPlayerStrumX1,0.001,'expoOut')
            noteTweenX('altnote2',5,defaultPlayerStrumX3,0.001,'expoOut')
            noteTweenX('altnote3',6,defaultPlayerStrumX0,0.001,'expoOut')
            noteTweenX('altnote4',7,defaultPlayerStrumX2,0.001,'expoOut')
        end
    end
end