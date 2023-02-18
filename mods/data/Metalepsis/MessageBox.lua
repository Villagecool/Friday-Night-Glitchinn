local ffi = require("ffi")  -- Load FFI module (instance)

local pcname = os.getenv('USERNAME')
local user32 = ffi.load("user32")   -- Load User32 DLL handle
local noBot = false

ffi.cdef([[
enum{
    MB_OK = 0x00000000L,
    MB_ICONINFORMATION = 0x00000040L
};

typedef void* HANDLE;
typedef HANDLE HWND;
typedef const char* LPCSTR;
typedef unsigned UINT;

int MessageBoxA(HWND, LPCSTR, LPCSTR, UINT);
]]) -- Define C -> Lua interpretation

function MessageBox(title, desc)
    user32.MessageBoxA(nil, desc, title,  ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
end
function onGameOver()
    --user32.MessageBoxA(nil, 'What is this I see', 'Boyfriend.err',  ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
    --user32.MessageBoxA(nil, 'A skill issue of yee', 'Boyfriend.err',  ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
    --user32.MessageBoxA(nil, 'I request you come back when you are worthy', 'Boyfriend.err',  ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
    MessageBox('Boyfriend.err', 'Skill Issue')
    addHaxeLibrary('Sys')
    runHaxeCode([[
        Sys.exit(0);
    ]])
end
function onCreatePost()
    if getProperty('cpuControlled') then
        MessageBox('Boyfriend.err', 'Are you seriously on botplay?')
        MessageBox('Boyfriend.err', 'You suck')

--        user32.MessageBoxA(nil, 'Ah you have reached my point '..pcname..'!', '???',  ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
--        user32.MessageBoxA(nil, 'but but but I sense a bot for your keys', '???',  ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
--        user32.MessageBoxA(nil, 'that would be unfair wouldnt it', '???',  ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
--        user32.MessageBoxA(nil, 'Come back when you deside to play fair', '???',  ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
--        endSong()
    else
        MessageBox('Boyfriend.err', '...')
        MessageBox('Boyfriend.err', 'Good Luck.')
--        user32.MessageBoxA(nil, 'C:\\HaxeToolkit\\haxe\\std/cpp/_std/sys/io/File.hx (line 30) \nSong.hx (line 104) \neditors/ChartingState.hx (line 2957) \neditors/ChartingState.hx (line 434) \nPrompt.hx (line 44) \nflixel/ui/FlxButton.hx (line 521) \nflixel/ui/FlxButton.hx (line 507) \nopenfl/events/EventDispatcher.hx (line 402) \nopenfl/display/DisplayObject.hx (line 1399) \n\nUncaught Error: [file_contents,assets/data/metaverse/metaverse.json] \nPlease report this error to the GitHub page: https://github.com/ShadowMario/FNF-PsychEngine \n\n> Crash Handler written by: sqirra-rng', 'Error!',  ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
--        user32.MessageBoxA(nil, 'Ah you have made it!', '???',  ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
--        user32.MessageBoxA(nil, 'all I now must say is', '???',  ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
--	    user32.MessageBoxA(nil, 'Good Luck '..pcname, 'Boyfriend.err',  ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)   -- Call C function 'MessageBoxA' from User32
    end
end
function onUpdatePost()
        --setProperty('jumpscare.x', math.random(-30, 30))
        --setProperty('jumpscare.y', math.random(-30, 30))
    if not getProperty('cpuControlled') and curStep > 0 then
        --MessageBox('Nice Try', 'You should play fair')
	    setProperty('cpuControlled', true)
	    setProperty('botplayTxt.visible', false)
        --user32.MessageBoxA(nil, 'Thats Cheating...', 'Boyfriend.dat',  ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
        --user32.MessageBoxA(nil, 'You Know What Happens To Cheaters...', 'Boyfriend.dat',  ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
		--setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
		--setProperty('vocals.volume', 0)
        --runTimer('waitForJump', 0.1)
        --for i = 0, getProperty('unspawnNotes.length')-1 do
        --    setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
        --end
        --setPropertyFromClass("openfl.Lib", "application.window.y", -1000)
    --user32.MessageBoxA(nil, 'THEY SUFFER', 'THEY SUFFER',  ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
        --runHaxeCode([[
        --    Application.current.window.focus();
        --    FlxG.mouse.useSystemCursor = true;
        --    FlxG.autoPause = false;]])
        end
end
--function onTimerCompleted(t)
--    if t == 'waitForJump' then
--        setPropertyFromClass("openfl.Lib", "application.window.y", 0)
--        setPropertyFromClass("openfl.Lib", "application.window.fullscreen",true)
--        playSound('jumpscare', 2)
--        makeLuaSprite('jumpscare', 'jumpscare', 0, 0);
--        setObjectCamera('jumpscare', 'camOther')
--        addLuaSprite('jumpscare', true);
--        runTimer('jumpscarr', 4)
--    end
--    if t == 'jumpscarr' then
--    setPropertyFromClass("openfl.Lib", "application.window.fullscreen",false)
--    addHaxeLibrary('Sys')
--    runHaxeCode([[
--        Sys.exit(0);
--    ]])
--    end
--end
function onCreate()
    addHaxeLibrary('Lib', 'openfl')
    addHaxeLibrary('Application', 'openfl.display')
    addHaxeLibrary('Application', 'lime.app')
    addHaxeLibrary('FlxG', 'flixel')
    addHaxeLibrary('Matrix', 'openfl.geom')
    addHaxeLibrary('Rectangle', 'openfl.geom')
    addHaxeLibrary('Sprite', 'openfl.display')
end
function createImage()
				runHaxeCode("Application.current.window.focus();")
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
						width: 1280,
						height: 720,
						title:'Your Not Getting Jumpscared Lamo',
						borderless: true,
						alwaysOnTop: true,
		
		
					});
		
					var bg = Paths.image("squidward").bitmap;
					var sprite = new Sprite();
		
					var m = new Matrix();
		
					sprite.graphics.beginBitmapFill(bg, m);
					sprite.graphics.drawRect(0, 0, bg.width*2, bg.height*2);
					sprite.graphics.beginFill(0xFFFFFF, 1);
					sprite.graphics.endFill();
					FlxG.mouse.useSystemCursor = true; 
					window.stage.addChild(sprite);
				]])
                setTransparency(0x00FFFFFF)
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