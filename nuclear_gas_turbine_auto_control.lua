print("Lo")
print("-----STARTING-----")

local component = require("component")
local sides = require("sides")
local colors = require("colors")
local rs = component.redstone
local computer = require("computer")
local term = require("term")

reactor = component.nc_fission_reactor

print("-----RESETTING BACKUP-----")
rs.setBundledOutput(sides.left, colors.green, 0)
rs.setBundledOutput(sides.left, colors.yellow, 0)
rs.setBundledOutput(sides.left, colors.black, 0)


computer.beep(1000, 1)

function totalPowerLevel()
  return reactor.getEnergyStored()
end

backup = false

function startGasTurbine()
  print("=====Starting Gas Turbine=====")
  computer.beep(500, 1)
  computer.beep(700, 1)
  print("Generator start: status:ON, spool:ON, ignition:ON")
  rs.setBundledOutput(sides.left, colors.black, 255)
  rs.setBundledOutput(sides.left, colors.yellow, 255)
  rs.setBundledOutput(sides.left, colors.green, 255)
  os.sleep(15)
  print("Generator start: spool:OFF")
  rs.setBundledOutput(sides.left, colors.yellow, 0)
  os.sleep(5)
  print("Generator start: ignition:OFF")
  rs.setBundledOutput(sides.left, colors.green, 0)
  -- Turn off dieselGen
  print("Generator start: Diesel-Backup:OFF")
  rs.setBundledOutput(sides.left, colors.white, 0)
  backup = true
end

function resetBackUp()
  -- Don't print here
  rs.setBundledOutput(sides.left, colors.white, 0)
  rs.setBundledOutput(sides.left, colors.black, 0)
end

local x = true

while(x)
do
  if totalPowerLevel() < 1000 and backup == false then
    computer.beep(500, 1)
    print("Trying to start diesel generator")
    rs.setBundledOutput(sides.left, colors.white, 255)
    os.sleep(10)
    startGasTurbine()
  elseif totalPowerLevel() > 100 then
    backup = false
    resetBackUp()
    os.sleep(1)
    term.clear()
    print("Power in reactor: ", reactor.getEnergyStored())
    print("Power in base: ", totalPowerLevel())
  end

  if rs.getInput(sides.back) > 0 then
    resetBackUp()
    x = false
  end 
end