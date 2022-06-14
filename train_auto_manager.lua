local component = require("component")
local computer = require("computer")
local rs = component.redstone
local sides = require("sides")
local term = require("term")

local x = true
local totalFuel = 0
local totalCago = 0

while(x)
do
  term.clear()

  local train = component.ir_augment_detector.info()
   
  if train == nil then
     -- If there are no values.
     print("NO TRAIN/CARGO PRESENT")
     print("-----TRAIN MANAGER----")
     print("    /|~~~~~          ")
     print(" /=====[*]| |======| ")
     print("[|o----oO-|-|o====o| ")

  else 
    -- Print info
    print("NAME: ", train.name)
    print("CARGO: ", train.cargo_precent)
    print("FLUID ", train.fluid_amount)
  end 

  if rs.getInput(sides.back) > 0 then
     -- Check if the off switch has been triggered.
     x = false
  end

  os.sleep(1)
  
end