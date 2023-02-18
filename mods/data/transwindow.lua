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

function onCreatePost()
	setProperty('fpsCounter.visible', false)
	CURRENT_X = getPropertyFromClass("openfl.Lib", "application.window.x")
	CURRENT_Y = getPropertyFromClass("openfl.Lib", "application.window.y")
	makeLuaSprite('greenscreen', 'greenscreen', -300, -300);
	setScrollFactor('greenscreen', 0, 0);
	scaleObject('greenscreen', 3, 3);
	addLuaSprite('greenscreen', false);
	--setPropertyFromClass("openfl.Lib", "application.window.borderless",true)
	--setPropertyFromClass("openfl.Lib", "application.window.fullscreen",true)
	setProperty('camHUD.scale.x', 0.5)
	setProperty('camHUD.scale.y', 0.5)
    local hwnd = ffi.C.GetActiveWindow()
    
    if ffi.C.SetWindowLongA(hwnd, -20, 0x00080000) ~= 0 then
		ffi.C.SetLayeredWindowAttributes(hwnd, ffi.C.COLOR_REF, 0, 0x00000001) 
    end
end
function onDestroy()
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.7') then
	setPropertyFromClass("openfl.Lib", "application.window.fullscreen",true)
	setPropertyFromClass("openfl.Lib", "application.window.borderless",true)
end
	setPropertyFromClass("openfl.Lib", "application.window.borderless",false)
	setPropertyFromClass("openfl.Lib", "application.window.fullscreen",false)
	setPropertyFromClass("openfl.Lib", "application.window.x", CURRENT_X)
	setPropertyFromClass("openfl.Lib", "application.window.y", CURRENT_Y)
    --local hwnd = ffi.C.GetActiveWindow()
    --if ffi.C.SetWindowLongA(hwnd, -20, 0x00080000) ~= 0 then
	--	ffi.C.SetLayeredWindowAttributes(hwnd, ffi.C.COLOR_REF, 0, 0xFF0C0C0C) 
    --end
end