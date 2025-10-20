local Effects = {}

Effects["Burn"] = function(humanoid: Humanoid)
	task.spawn(function()
		for i = 1, 3, 1 do
			humanoid.Health -= 10
			print("Health: " .. humanoid.Health)
			task.wait(1)
		end
	end)
end

return Effects
