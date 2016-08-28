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

local function accelerando(startBeat, endBeat, startBpm, endBpm, div)
   local bpms = {}
   
   assert(startBeat < endBeat)
   
   local beatDiff = endBeat - startBeat
   local bpmDiff = endBpm - startBpm
   local total = div + 1
   local beatStep = beatDiff / div
   local bpmStep = bpmDiff / div
   
   for i = 1, total do
      local currentBeat = (beatStep * (i - 1)) + startBeat
      local currentBpm = (bpmStep * (i - 1)) + startBpm
      
      print(currentBeat .. "\t" .. currentBpm)
      
      bpms[currentBeat] = currentBpm
   end
   
   local str = ""
   
   for k, v in pairs(bpms) do
      str = str .. string.format("%03.3f=%03.3f,", k, v)
   end
   
   return str
end

if #arg ~= 5 then
   print("Usage: accelerando(startBeat, endBeat, startBpm, endBpm, div)")
else
   print(accelerando(arg[1], arg[2], arg[3], arg[4], arg[5]))
end
