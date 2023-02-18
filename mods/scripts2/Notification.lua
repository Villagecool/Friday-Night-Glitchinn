--Toast Song Notification

local artist = 'multi'
local Insturmental = 'N/A'
local Vocals = 'N/A'
local song = '???'


--songs
function onCreate()
    if songName == 'sakura' then
        artist = 'PhoenixPH'
        song = 'Sakura'
    end
    if songName == 'fear' then
        artist = 'multi'
        Insturmental = 'Color'
        Vocals = 'Hayumzah'
        song = 'Fear'
    end
    if songName == 'metalepsis' then
        artist = 'multi'
        song = 'Metalepsis'
    end
end






--Goofy Ahh Code
local spaces = '                                                       '
function onCreatePost()
    if not artist == 'multi' then
        doToastNotification('Friday Night Glitchin','Song By: '..artist..spaces..spaces..song..' - '..difficultyName)
    elseif artist == 'multi' then
        doToastNotification('Friday Night Glitchin','Insturmental By: '..Insturmental..spaces..'Vocals By: '..Vocals..spaces..song..' - '..difficultyName)
    end
end

function doToastNotification(title, desc)
        os.execute([[ powershell -Command "& {$ErrorActionPreference = 'Stop';$title = ]] ..  [[']] .. desc .. [[']] .. [[;[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null;$template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText01);$toastXml = [xml] $template.GetXml();$toastXml.GetElementsByTagName('text').AppendChild($toastXml.CreateTextNode($title)) > $null;$xml = New-Object Windows.Data.Xml.Dom.XmlDocument;$xml.LoadXml($toastXml.OuterXml);$toast = [Windows.UI.Notifications.ToastNotification]::new($xml);$toast.Tag = 'Test1';$toast.Group = 'Test2';$toast.ExpirationTime = [DateTimeOffset]::Now.AddSeconds(5);$notifier = [Windows.UI.Notifications.ToastNotificationManager]:]].. [[:CreateToastNotifier(']] .. title  .. [[');]].. [[$notifier.Show($toast);}"]] )
        addHaxeLibrary('Application', 'lime.app')
end