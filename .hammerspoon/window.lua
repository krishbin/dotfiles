
-----------------------
--  position window  --
-----------------------

-- half of screen

hs.hotkey.bind(hyper, 'h', function() hs.window.focusedWindow():moveToUnit({0, 0, 0.5, 1}) end)
hs.hotkey.bind(hyper, 'l', function() hs.window.focusedWindow():moveToUnit({0.5, 0, 0.5, 1}) end)
hs.hotkey.bind(hyper, 'k', function() hs.window.focusedWindow():moveToUnit({0, 0, 1, 0.5}) end)
hs.hotkey.bind(hyper, 'j', function() hs.window.focusedWindow():moveToUnit({0, 0.5, 1, 0.5}) end)

-- quarter of screen
hs.hotkey.bind(hyper_s, 'h', function() hs.window.focusedWindow():moveToUnit({0, 0, 0.5, 0.5}) end)
hs.hotkey.bind(hyper_s, 'l', function() hs.window.focusedWindow():moveToUnit({0.5, 0.5, 0.5, 0.5}) end)
hs.hotkey.bind(hyper_s, 'k', function() hs.window.focusedWindow():moveToUnit({0.5, 0, 0.5, 0.5}) end)
hs.hotkey.bind(hyper_s, 'j', function() hs.window.focusedWindow():moveToUnit({0, 0.5, 0.5, 0.5}) end)

-- full screen
hs.hotkey.bind(hyper, 'return', function() hs.window.focusedWindow():moveToUnit({0, 0, 1, 1}) end)

-- center screen
hs.hotkey.bind(hyper, 'c', function() hs.window.focusedWindow():centerOnScreen() end)

-- move between displays
hs.hotkey.bind(hyper_c, 'l', function()
  local win = hs.window.focusedWindow()
  local next = win:screen():toEast()
  if next then
    win:moveToScreen(next, true)
  end
end)
hs.hotkey.bind(hyper_c, 'h', function()
  local win = hs.window.focusedWindow()
  local next = win:screen():toWest()
  if next then
    win:moveToScreen(next, true)
  end
end)

-- window hints
hs.hotkey.bind({'shift', 'cmd'}, 'h', hs.hints.windowHints)

-- grid gui
hs.grid.setMargins({w = 0, h = 0})
hs.grid.setGrid('10x6')
hs.grid.ui.textSize = 60
hs.hotkey.bind({'shift', 'cmd'}, 'g', hs.grid.show)

-- change window position and size

hs.hotkey.bind(hyper, "left", function()
  local win = hs.window.focusedWindow()
  if win == nil then return end
  local screen = win:screen()
  local g = hs.grid.get(win)
  local sg = hs.grid.getGrid(screen)
  if g.x + g.w >= sg.w and g.x ~= 0 then
     g.x = g.x - 1
     g.w = g.w + 1
     hs.grid.set(win, g)
  else
     g.w = g.w - 1
     hs.grid.set(win, g)
  end
end)

hs.hotkey.bind(hyper,"t", function()
  local win = hs.window.focusedWindow()
  if win == nil then return end
  local screen = win:screen()
  local g = hs.grid.get(win)
  local sg = hs.grid.getGrid(screen)
  hs.alert.show(g)
end)
hs.hotkey.bind(hyper, "right", function()
  local win = hs.window.focusedWindow()
  if win == nil then return end
  local screen = win:screen()
  local g = hs.grid.get(win)
  local sg = hs.grid.getGrid(screen)
  if g.x + g.w == sg.w then
     g.x = g.x + 1
     g.w = g.w - 1
     hs.grid.set(win, g)
  else
     g.w = g.w + 1
     hs.grid.set(win, g)
  end
end)

hs.hotkey.bind(hyper, "down", function()
  local win = hs.window.focusedWindow()
  if win == nil then return end
  local screen = win:screen()
  local g = hs.grid.get(win)
  local sg = hs.grid.getGrid(screen)
  if g.y + g.h == sg.h then
     g.y = g.y + 1
     g.h = g.h - 1
     hs.grid.set(win, g)
  else
     g.h = g.h + 1
     hs.grid.set(win, g)
  end
end)

hs.hotkey.bind(hyper, "up", function()
  local win = hs.window.focusedWindow()
  if win == nil then return end
  local screen = win:screen()
  local g = hs.grid.get(win)
  local sg = hs.grid.getGrid(screen)
  if g.y + g.h >= sg.h and g.y ~= 0 then
     g.y = g.y - 1
     g.h = g.h + 1
     hs.grid.set(win, g)
  else
     g.h = g.h - 1
     hs.grid.set(win, g)
  end
end)
