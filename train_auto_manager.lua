local component = require("component")
local computer = require("computer")
local rs = component.redstone
local sides = require("sides")
local term = require("term")

x = true

while(x)
do
  term.clear()
  local train = component.ir_augment_detector

  print(train.info().name)
  print(train.info().cargo_precent)
  print(train.info().fluid_amount)
  print(train.getTag())

  if rs.getInput(sides.back) > 0 then
    x = false
  end

  os.sleep(1)
  
end