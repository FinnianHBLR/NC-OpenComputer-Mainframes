local component = require("component")
local computer = require("computer")

reactor = component.nc_fission_reactor

local power = reactor.getEnergyStored()
print(power)