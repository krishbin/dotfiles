hyper = {"ctrl","alt"}
hyper_s = {"ctrl","alt","shift"}
hyper_c = {"ctrl","alt","command"}
hyper_a = {"ctrl","command"}

require('window')
require('layout')
clipboardTool = hs.loadSpoon("ClipboardTool")
hs.loadSpoon("FnMate")
--general
clipboardTool.show_in_menubar = false
clipboardTool.paste_on_select = true
hs.hotkey.bind(hyper_c, "v", function() clipboardTool:toggleClipboard() end)
hs.hotkey.bind(hyper_s, "v", function() clipboardTool:clearAll() end)
clipboardTool:start()

hs.window.animationDuration = 0
hs.window.setShadows(false)


-------------------------
--  open app or focus  --
-------------------------


hs.fnutils.each({
        { key = "t", app = "alacritty"},
        { key = "e", app = "VimR"},
        { key = "r", app = "Skim"},
        { key = "f", app = "Firefox Developer Edition"},
        { key = "m", app = "/Applications/Thunderbird.app"},
        { key = "p", app = "/Applications/KeePassXC.app"},
},function(object)
        hs.hotkey.bind(hyper_a, object.key,
        function()
                local app = hs.application.get(object.app)
                if app then
                        if not app:mainWindow() then
                                app:selectMenuItem({object.app, "New OS window"})
                        elseif app:isFrontmost() then
                                app:hide()
                        else
                                app:activate()
                        end
                else
                        hs.application.launchOrFocus(object.app)
                end
        end)
end)
