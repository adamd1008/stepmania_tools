--[[
-- Copyright (c) 2016 Adam Dodd
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
]]

local function repeat_pause(pauseTime, startBeat, interval, count)
   local pauseTime = assert(tonumber(pauseTime))
   local startBeat = assert(tonumber(startBeat))
   local interval = assert(tonumber(interval))
   local count = assert(tonumber(count))
   
   assert(pauseTime > 0)
   assert(startBeat > 0)
   assert(interval > 0)
   assert(count > 0)
   
   local cur = startBeat
   local str = ""
   
   for i = 1, count do
      str = str .. string.format(",%03.3f=%03.3f\n", cur, pauseTime)
      cur = cur + interval
   end
   
   return str
end

if #arg ~= 4 then
   print("Usage: " .. arg[0] .. " <pauseTime> <startBeat> <intervalInBeats> " ..
         "<count>")
else
   print(repeat_pause(arg[1], arg[2], arg[3], arg[4]))
end
