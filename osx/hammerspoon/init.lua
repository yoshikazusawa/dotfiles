--- utilities
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)

hs.hotkey.bind({"cmd", "alt", "shift"}, "N", function()
  print(hs.inspect(hs.application.frontmostApplication():name()))
end)

-- toggle IME on/off
hs.hotkey.bind({"ctrl"}, "space", function()
  hs.eventtap.keyStroke({"ctrl", "cmd"}, "i", 10)
end)


-- see karabiner
local eisuu = "f15"
local kana = "f16"
local cmd_r = "f17"


local nmap = {}

-- append jis keycodes map
hs.keycodes.map["_"] = 0x5e
hs.keycodes.map["kana"] = 0x68
hs.keycodes.map["eisuu"] = 0x66


nmap[eisuu] = {
  default = { {}, "escape" },
  common = {
    ["e"] = { {}, "up" }, -- send "↑"
    ["d"] = { {}, "down" }, -- send "↓"
    ["s"] = { {}, "left" }, -- send "←"
    ["f"] = { {}, "right" }, -- send "→"
  },
  app = {
    ["Google Chrome"] = {
      ["w"] = { {"cmd", "alt"}, "left" }, -- previous tab
      ["r"] = { {"cmd", "alt"}, "right" }, -- next tab
    },
    ["iTerm2"] = {
      ["j"] = { {"ctrl"}, "w", {}, "j" }, -- vim move down window
      ["k"] = { {"ctrl"}, "w", {}, "k" }, -- vim move up window
      ["h"] = { {"ctrl"}, "w", {}, "h" }, -- vim move left window
      ["l"] = { {"ctrl"}, "w", {}, "l" }, -- vim move left window
      ["n"] = { {}, "g", {"shift"}, "t" }, -- vim move left tab
      ["m"] = { {}, "g", {}, "t" }, -- vim move right tab
      ["c"] = { {"ctrl"}, "b", {}, "c" }, -- tmux create tab
      ["r"] = { {"ctrl"}, "b", {}, "n" }, -- tmux move right window (next)
      ["w"] = { {"ctrl"}, "b", {}, "p" }, -- tmux move left window (previous)
      ["a"] = { {"ctrl"}, "b", {}, "," }, -- tmux rename window
      ["1"] = { {"ctrl"}, "b", {}, "0" }, -- tmux move first window
      ["x"] = { {"ctrl"}, "b", {}, "x" }, -- tmux kill current pane
      ["z"] = { {"ctrl"}, "b", {}, "d" }, -- tmux detach current session
    },
  },
}

nmap[kana] = {
  default = { {}, "return" },
  common = {
    ["j"] = { {"shift"}, "8" }, -- send "("
    ["k"] = { {"shift"}, "9" }, -- send ")"
    ["u"] = { {}, "[" },
    ["i"] = { {}, "]" },
    ["m"] = { {"shift"}, "[" }, -- send "{"
    [","] = { {"shift"}, "]" }, -- send "}"
    ["f"] = { {"shift"}, ";" }, -- send "+"
    ["r"] = { {}, "-" },
    ["b"] = { {"shift"}, "-" }, -- send "="
    ["n"] = { {}, "_" },
    ["g"] = { {"shift"}, "2" }, -- send '"'
    ["h"] = { {"shift"}, "7" }, -- send "'"
    ["t"] = { {"shift"}, "5" }, -- send '%'
    ["y"] = { {"shift"}, "6" }, -- send "&"
    ["q"] = { {}, "7" }, 
    ["w"] = { {}, "8" }, 
    ["e"] = { {}, "9" }, 
    ["a"] = { {}, "4" }, 
    ["s"] = { {}, "5" }, 
    ["d"] = { {}, "6" }, 
    ["v"] = { {}, "0" }, 
    ["z"] = { {}, "1" }, 
    ["x"] = { {}, "2" }, 
    ["c"] = { {}, "3" }, 
  },
  app = {
    ["Google Chrome"] = {}
  }
}

nmap[cmd_r] = {
  default = { {}, "delete" },
  common = {
    ["w"] = { {"shift"}, "2" }, -- send '"'
    ["q"] = { {"shift"}, "7" }, -- send "'"
    ["p"] = { {"shift"}, "5" }, -- send '%'
    ["a"] = { {"shift"}, "6" }, -- send "&"
    ["s"] = { {""}, "/" }, -- send "/"
    ["d"] = { {"shift"}, "4" }, -- send "$"
    ["h"] = { {"shift"}, "3" }, -- send "#"
    ["t"] = { {"shift"}, "^" }, -- send "~"
    ["b"] = { {"shift"}, "@" }, -- send "`"
    ["e"] = { {"shift"}, "-" }, -- send "="
  },
  app = {
  },
}


--- conveet array elements to table keys.
-- @param table array
-- @return { array_element[1] = true, array_element[2] = true, ... }
local function arrayToMap(table)
  local ret = {}
  hs.fnutils.each(table, function(v)
    ret[v] = true
  end)
  return ret
end

local function initEventtap(modKey, def)
  local operated = false
  local timer = nil
  local modKeyCode = hs.keycodes.map[modKey]
  
  local hotkeys = {}

  local eventtap = hs.eventtap.new({
    hs.eventtap.event.types.keyDown, 
    hs.eventtap.event.types.keyUp,
  }, function(e)
    local code = e:getKeyCode()
    local key = hs.keycodes.map[code]
    
    if code == modKeyCode then return false end
    if not(hotkeys[key]) then return true end
    
    operated = true
    local hotkey = hotkeys[key]  

    e:setFlags(arrayToMap(hotkey[1]))    
    e:setKeyCode(hs.keycodes.map[hotkey[2]])
    
    local extra = nil
    if hotkey[3] and hotkey[4] then
      extra = e:copy()
      extra:setFlags(arrayToMap(hotkey[3]))
      extra:setKeyCode(hs.keycodes.map[hotkey[4]])     
    end
    return true, {e, extra}
  end)
    
  local function pressed()
    -- initialize state
    operated = false
    timer = hs.timer.doAfter(1, function()
      operated = true
    end)
    
    -- collect hotkeys
    hotkeys = hs.fnutils.copy(def.common)

    local appName = hs.application.frontmostApplication():name()    
    if def.app[appName] then
      for key,value in pairs(def.app[appName]) do
        hotkeys[key] = value
      end
    end
    
    -- enable hotkeys
    eventtap:start()
  end
  
  local function released()
    -- cleaning
    hotkeys = {}
    eventtap:stop()
    timer = nil
    
    if not(operated) then
      hs.eventtap.keyStroke(def.default[1], def.default[2], 10)
    end
  end
  
  local function repeated()
     -- do nothing
  end

  hs.hotkey.bind({}, modKey, pressed, released, repeated)
end

for code, def in pairs(nmap) do
  initEventtap(code, def)
end



--- 

local quitModal = hs.hotkey.modal.new('cmd','q')

function quitModal:entered()
    hs.alert("Press Cmd+Q again to quit", 1)
    hs.timer.doAfter(1, function() quitModal:exit() end)
end

quitModal:bind('cmd', 'q', function()
    quitModal:exit()
    hs.application.frontmostApplication():kill()   
end)

quitModal:bind('', 'escape', function() quitModal:exit() end)


hs.alert.show("Config loaded")

