local Connection = {}

local ConnectionBase = {}
local InvokedBase = {}
ConnectionBase.__index = ConnectionBase
InvokedBase.__index = InvokedBase

function ConnectionBase:Invoke(...)
	for _, Data in next, self.Listeners do
		coroutine.wrap(Data.Callback)(...)
	end
	for i,v in next, self.Yielded do
		self.Yielded[i] = nil
		coroutine.resume(v, ...)
	end
end
function InvokedBase:Connect(f)
	local Connection = self.INTERNAL_Reference
	local Timestamp = os.clock()
	local Data = {
		Disconnect = function(self)
			self.Connected = false
			Connection.Listeners[Timestamp] = nil
		end,
		Callback = f,
		Connected = true
	}
	
	Connection.Listeners[Timestamp] = Data
	return Data
end
function InvokedBase:Wait()
	local Connection = self.INTERNAL_Reference
	Connection.Yielded[#Connection.Yielded + 1] = coroutine.running()
	return coroutine.yield()
end

function Connection.new()
	local Meta = setmetatable({
		Listeners = {},
		Invoked = setmetatable({INTERNAL_Reference = false}, InvokedBase),
		Yielded = {}
	}, ConnectionBase)
	Meta.Invoked.INTERNAL_Reference = Meta
	
	return Meta
end

return Connection
