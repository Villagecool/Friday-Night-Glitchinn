--made by Mexoed, Heavily Edited By Villagecool
--if you use this give credit 
--if you steal this u smell like burnt shit and hair

--the codes you cna edit them however you want 
--num1 min 00 max 75 
--num2 min 00 max 25 



-- Vars

Detect = true
num1 = 0 -- min 00 max 75 
num2 = 0 -- min 00 max 25 
num3 = 0 -- min 00 max 75 
num4 = 0 -- min 00 max 25 
enterNumb = 1
--Numbers = {'NUMPADZERO','NUMPADONE','DOWN','NUMPADTHREE','LEFT','NUMPADFIVE','RIGHT','NUMPADSEVEN','UP','NUMPADNINE'}
Numbers = {'NUMPADZERO','NUMPADONE','NUMPADTWO','NUMPADTHREE','NUMPADFOUR','NUMPADFIVE','NUMPADSIX','NUMPADSEVEN','NUMPADEIGHT','NUMPADNINE'}
local secretTries = 0
local ffi = require("ffi")
local pcname = os.getenv('USERNAME')
if pcname == 'gloga' then
     pcname = 'Villagecool'
end
local user32 = ffi.load("user32")
local shadname = "error"
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

function secretTest()
     if secretTries == 0 then
          initLuaShader(shadname)
      
          makeLuaSprite("grapshad")
          makeGraphic("grapshad", screenWidth, screenHeight)
          setSpriteShader("grapshad", shadname)
  
          addHaxeLibrary("ShaderFilter", "openfl.filters")
          setSpriteShader("screen", shadname)
          runHaxeCode([[
          game.camOther.setFilters([new ShaderFilter(game.getLuaObject("grapshad").shader)]);
          ]])
          MessageBox('???', 'All of them...')
     elseif secretTries == 1 then
          MessageBox('???', 'Gone...')
     elseif secretTries == 2 then
          MessageBox('???', 'Dead...')
     elseif secretTries == 3 then
          MessageBox('???', 'Corrupted...')
     elseif secretTries == 4 then
          MessageBox('???', 'But One Remains...')
     elseif secretTries == 5 then
          MessageBox('???', 'Their Name is...')
     elseif secretTries == 6 then
          MessageBox('???', pcname..'.')
          onTeleportSong('Metalepsis', 1)
     end
     secretTries = secretTries+1
end






function onPass()
     if enterNumb > 4 then
          if num1 == 6 and num2 == 9 and num3 == 6 and num4 == 9 then
               enterNumb = 1
               addLuaScript('scripts2/PopUp')
          elseif num1 == 7 and num2 == 4 and num3 == 1 and num4 == 9 then
               enterNumb = 1
               num1 = 0 -- min 00 max 75 
               num2 = 0 -- min 00 max 25 
               num3 = 0 -- min 00 max 75 
               num4 = 0 -- min 00 max 25
               secretTest()
          elseif num1 == 3 and num2 == 3 and num3 == 7 and num4 == 8 then
               enterNumb = 1
               num1 = 0 -- min 00 max 75 
               num2 = 0 -- min 00 max 25 
               num3 = 0 -- min 00 max 75 
               num4 = 0 -- min 00 max 25
               onTeleportSong('ow', 1)
          else
               playSound('cancelMenu', 1, false)
               num1 = 0 -- min 00 max 75 
               num2 = 0 -- min 00 max 25 
               num3 = 0 -- min 00 max 75 
               num4 = 0 -- min 00 max 25 
               enterNumb = 1
          end
     end
end







--DONT TOUCH ANYTHING BEYOND THIS POINT 
function onCreate() 

     addHaxeLibrary('Lib', 'openfl')
     addHaxeLibrary('Application', 'openfl.display')
     addHaxeLibrary('Application', 'lime.app')
     addHaxeLibrary('FlxG', 'flixel')
     addHaxeLibrary('Matrix', 'openfl.geom')
     addHaxeLibrary('Rectangle', 'openfl.geom')
     addHaxeLibrary('Sprite', 'openfl.display')

     makeLuaText('n1', enterNumb..',       '..num1..', '..num2..', '..num3..', '..num4..', ', nil, 0, 400)
	screenCenter('n1', 'xy')
     setTextFont('n1', 'sonic-cd-menu-font.ttf')
     setTextColor('n1', '696969')
     setTextBorder('n1', 0)
     setTextSize('n1', 30)
     setObjectCamera('n1', 'other')
     addLuaText('n1', true)

	makeLuaSprite('vig', 'vig', 0, 0)
	addLuaSprite('vig', true)
	setObjectCamera('vig', 'camOther')
	setProperty('vig.alpha', 0)

     makeLuaSprite('BFblacklol', nil, 0, 0)
     makeGraphic('BFblacklol', 1500, 1000, 'ffffff')
     setObjectCamera('BFblacklol', 'other')
     setProperty('BFblacklol.alpha', 0)
     addLuaSprite('BFblacklol', true)
end


local allowCountdown = false;
function onStartCountdown()
     if not allowCountdown then -- Block the first countdown
          allowCountdown = true;    
          playMusic('codesIdle', 1, true)
          return Function_Stop
     end
     return Function_Continue
end
--Numbers = {'A','B','C','D','E','F','G','H','I','J'}
function onUpdate(elapsed)
     if keyboardJustPressed('SHIFT') then
          exitSong()
     end
     if keyboardJustPressed('ESCAPE') then
          exitSong()
     end
     if keyboardJustPressed('BACKSPACE') then
          exitSong()
     end
     if keyboardJustPressed('SPACE') then
          restartSong()
     end
          checkNumber()
     setTextString('n1', num1..', '..num2..', '..num3..', '..num4..', ')
     onPass()
end

function onTeleportSong(name, diff)
     playSound('ToggleJingle', 1, false)
     playMusic('', 0, false)
     doTweenAlpha(nil, 'BFblacklol', 1, 0.4, 'linear')
     ezTimer(nil, 2, function()
          loadSong(name, diff)
     end)
end

function onGetKey(key) -- I know this useless but I hate long code's they, hurt my brain a lot
     return getPropertyFromClass('flixel.FlxG', 'keys.justPressed.'..key)
end

timers = {}
function ezTimer(tag, timer, callback) -- Better
     table.insert(timers,{tag, callback})
     runTimer(tag, timer)
end

function onTimerCompleted(tag)
     for k,v in pairs(timers) do
          if v[1] == tag then
               v[2]()
          end
     end
end
function checkNumber()
     if onGetKey('ANY') then
          playSound('scrollMenu', 0.3, false)
     end
     if onGetKey(Numbers[1]) then
          if enterNumb == 1 then
               num1 = 0
               enterNumb = enterNumb+1
          elseif enterNumb == 2 then
               num2 = 0
               enterNumb = enterNumb+1
          elseif enterNumb == 3 then
               num3 = 0
               enterNumb = enterNumb+1
          elseif enterNumb == 4 then
               num4 = 0
               enterNumb = enterNumb+1
          end
     end
     if onGetKey(Numbers[2]) then
          if enterNumb == 1 then
               num1 = 1
               enterNumb = enterNumb+1
          elseif enterNumb == 2 then
               num2 = 1
               enterNumb = enterNumb+1
          elseif enterNumb == 3 then
               num3 = 1
               enterNumb = enterNumb+1
          elseif enterNumb == 4 then
               num4 = 1
               enterNumb = enterNumb+1
          end
     end
     if onGetKey(Numbers[3]) or onGetKey('DOWN') then
          if enterNumb == 1 then
               num1 = 2
               enterNumb = enterNumb+1
          elseif enterNumb == 2 then
               num2 = 2
               enterNumb = enterNumb+1
          elseif enterNumb == 3 then
               num3 = 2
               enterNumb = enterNumb+1
          elseif enterNumb == 4 then
               num4 = 2
               enterNumb = enterNumb+1
          end
     end
     if onGetKey(Numbers[4]) then
          if enterNumb == 1 then
               num1 = 3
               enterNumb = enterNumb+1
          elseif enterNumb == 2 then
               num2 = 3
               enterNumb = enterNumb+1
          elseif enterNumb == 3 then
               num3 = 3
               enterNumb = enterNumb+1
          elseif enterNumb == 4 then
               num4 = 3
               enterNumb = enterNumb+1
          end
     end
     if onGetKey(Numbers[5]) or onGetKey('LEFT')  then
          if enterNumb == 1 then
               num1 = 4
               enterNumb = enterNumb+1
          elseif enterNumb == 2 then
               num2 = 4
               enterNumb = enterNumb+1
          elseif enterNumb == 3 then
               num3 = 4
               enterNumb = enterNumb+1
          elseif enterNumb == 4 then
               num4 = 4
               enterNumb = enterNumb+1
          end
     end
     if onGetKey(Numbers[6]) then
          if enterNumb == 1 then
               num1 = 5
               enterNumb = enterNumb+1
          elseif enterNumb == 2 then
               num2 = 5
               enterNumb = enterNumb+1
          elseif enterNumb == 3 then
               num3 = 5
               enterNumb = enterNumb+1
          elseif enterNumb == 4 then
               num4 = 5
               enterNumb = enterNumb+1
          end
     end
     if onGetKey(Numbers[7]) or onGetKey('RIGHT')  then
          if enterNumb == 1 then
               num1 = 6
               enterNumb = enterNumb+1
          elseif enterNumb == 2 then
               num2 = 6
               enterNumb = enterNumb+1
          elseif enterNumb == 3 then
               num3 = 6
               enterNumb = enterNumb+1
          elseif enterNumb == 4 then
               num4 = 6
               enterNumb = enterNumb+1
          end
     end
     if onGetKey(Numbers[8]) then
          if enterNumb == 1 then
               num1 = 7
               enterNumb = enterNumb+1
          elseif enterNumb == 2 then
               num2 = 7
               enterNumb = enterNumb+1
          elseif enterNumb == 3 then
               num3 = 7
               enterNumb = enterNumb+1
          elseif enterNumb == 4 then
               num4 = 7
               enterNumb = enterNumb+1
          end
     end
     if onGetKey(Numbers[9]) or onGetKey('UP')  then
          if enterNumb == 1 then
               num1 = 8
               enterNumb = enterNumb+1
          elseif enterNumb == 2 then
               num2 = 8
               enterNumb = enterNumb+1
          elseif enterNumb == 3 then
               num3 = 8
               enterNumb = enterNumb+1
          elseif enterNumb == 4 then
               num4 = 8
               enterNumb = enterNumb+1
          end
     end
     if onGetKey(Numbers[10]) then
          if enterNumb == 1 then
               num1 = 9
               enterNumb = enterNumb+1
          elseif enterNumb == 2 then
               num2 = 9
               enterNumb = enterNumb+1
          elseif enterNumb == 3 then
               num3 = 9
               enterNumb = enterNumb+1
          elseif enterNumb == 4 then
               num4 = 9
               enterNumb = enterNumb+1
          end
     end
end

function wavyadd(tag,xwave,ywave,xtime,ytime) -- idk how to make this public so its being empty :skull:
end
function onUpdatePost(elapsed)
	setProperty('vig.alpha', secretTries/6)
	setShaderFloat('grapshad','glitchAmplitude',0)
	setShaderFloat('grapshad','glitchMinimizer',0)
     cameraShake('other', secretTries/500, 0.2)
	--setShaderFloat('grapshad','glitchAmplitude',0.2)
     setShaderFloat("grapshad", "iTime", os.clock())
end