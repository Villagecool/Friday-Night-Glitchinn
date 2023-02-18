function onSongStart()
    setProperty('dad.visible',false)
    runHaxeCode([[
        windowDad = Application.current.createWindow({
            title: 'BOYFRIEND.xml',
            width: game.dad.frameWidth,
            height: game.dad.frameHeight,
            borderless: true,
            alwaysOnTop: true
        });]])

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
    
    runHaxeCode([[
        FlxG.mouse.useSystemCursor = true;
        windowDad.x = 20;
        windowDad.y = 50;
        dadWin = new Sprite();
        var dadScrollWin = new Sprite();
        windowDad.stage.addEventListener("keyDown", FlxG.keys.onKeyDown);
        windowDad.stage.addEventListener("keyUp", FlxG.keys.onKeyUp);
        var m = new Matrix();
        dadWin.graphics.beginBitmapFill(game.dad.pixels, m);
        dadWin.graphics.drawRect(0, 0, game.dad.pixels.width*2, game.dad.pixels.height*2);
        dadWin.graphics.endFill();
        bruh = new Sprite();
        bruh.graphics.beginFill(0x010101, 1);
        bruh.graphics.drawRect(0, 0, windowDad.width, windowDad.height);
        bruh.graphics.endFill();
        windowDad.stage.addChild(bruh);
        windowDad.stage.addChild(dadWin);
        dadWin.scaleX = game.camGame.zoom*2;
        dadWin.scaleY = game.camGame.zoom*2;
    ]])
    setTransparency(0x00010101)
    runHaxeCode("Application.current.window.focus();")
end



function onUpdate(elapsed)
            runHaxeCode([[  
        
                var dadFrame = game.dad._frame;
                
                if (dadFrame == null || dadFrame.frame == null) return; // prevents crashes (i think???)
                    
                var rect = new Rectangle(dadFrame.frame.x, dadFrame.frame.y, dadFrame.frame.width, dadFrame.frame.height);
                
                dadWin.scrollRect = rect;
                dadWin.x = (((dadFrame.offset.x) - (game.dad.offset.x)) * dadWin.scaleX*2);
                dadWin.y = (((dadFrame.offset.y) - (game.dad.offset.y)) * dadWin.scaleY*2);   
    
            ]])
        
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

function onCreate()
        addHaxeLibrary('Lib', 'openfl')
        addHaxeLibrary('Application', 'openfl.display')
        addHaxeLibrary('Application', 'lime.app')
        addHaxeLibrary('FlxG', 'flixel')
        addHaxeLibrary('Matrix', 'openfl.geom')
        addHaxeLibrary('Rectangle', 'openfl.geom')
        addHaxeLibrary('Sprite', 'openfl.display')
end

function onGameOver()
   runHaxeCode('windowDad.close();')
end