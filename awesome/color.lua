local color = { _NAME = "color" }
local _M = color

local esc = string.char(27, 91)

local names = {'black', 'red', 'green', 'yellow', 'blue', 'pink', 'cyan', 'white'}
local hi_names = {'BLACK', 'RED', 'GREEN', 'YELLOW', 'BLUE', 'PINK', 'CYAN', 'WHITE'}

color.fg, color.bg = {}, {}

for i, name in ipairs(names) do
   color.fg[name] = esc .. tostring(30+i-1) .. 'm'
   _M[name] = color.fg[name]
   color.bg[name] = esc .. tostring(40+i-1) .. 'm'
end

for i, name in ipairs(hi_names) do
   color.fg[name] = esc .. tostring(90+i-1) .. 'm'
   _M[name] = color.fg[name]
   color.bg[name] = esc .. tostring(100+i-1) .. 'm'
end

local function fg256(_,n)
   return esc .. "38;5;" .. n .. 'm'
end

local function bg256(_,n)
   return esc .. "48;5;" .. n .. 'm'
end

setmetatable(color.fg, {__call = fg256})
setmetatable(color.bg, {__call = bg256})

color.reset = esc .. '0m'
color.clear = esc .. '2J'

color.bold = esc .. '1m'
color.faint = esc .. '2m'
color.normal = esc .. '22m'
color.invert = esc .. '7m'
color.underline = esc .. '4m'

color.hide = esc .. '?25l'
color.show = esc .. '?25h'

function color.move(x, y)
   return esc .. y .. ';' .. x .. 'H'
end

color.home = color.move(1, 1)

--------------------------------------------------

function color.chart(ch,col)
   local cols = '0123456789abcdef'

   ch = ch or ' '
   col = col or color.fg.black
   local str = color.reset .. color.bg.WHITE .. col

   for y = 0, 15 do
      for x = 0, 15 do
         local lbl = cols:sub(x+1, x+1)
         if x == 0 then lbl = cols:sub(y+1, y+1) end

         str = str .. color.bg.black .. color.fg.WHITE .. lbl
         str = str .. color.bg(x+y*16) .. col .. ch
      end
      str = str .. color.reset .. "\n"
   end
   return str .. color.reset
end

function color.test()
   print(color.reset .. color.bg.green .. color.fg.RED .. "This is bright red on green" .. color.reset)
   print(color.invert .. "This is inverted..." .. color.reset .. " And this isn't.")
   print(color.fg(0xDE) .. color.bg(0xEE) .. "You can use xterm-256 colors too!" .. color.reset)
   print("And also " .. color.bold .. "BOLD" .. color.normal .. " if you want.")
   print(color.bold .. color.fg.BLUE .. color.bg.blue .. "Miss your " .. color.fg.RED .. "C-64" .. color.fg.BLUE .. "?" .. color.reset)
   print("Try printing " .. color.underline .. _M._NAME .. ".chart()" .. color.reset)
end

return color
