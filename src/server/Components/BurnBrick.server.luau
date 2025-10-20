local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Effects = require(ReplicatedStorage.Shared.Effects)

local TAG = "BurnBrick"
local EFFECT = "Burn"

local tagged = CollectionService:GetTagged(TAG)

local active = false

for _, v in tagged :: { Part } do
	v.Touched:Connect(function(hit)
		if active then
			return
		end

		active = true

		if hit.Parent:FindFirstChild("Humanoid") then
			assert(Effects[EFFECT], "Effect not exist... ERROR")
			Effects[EFFECT](hit.Parent.Humanoid)
		end

		task.wait(1)

		active = false
	end)
end

CollectionService:GetInstanceAddedSignal(TAG):Connect(function(instance)
	instance.Touched:Connect(function(hit)
		if active then
			return
		end

		active = true

		if hit.Parent:FindFirstChild("Humanoid") then
			assert(Effects[EFFECT], "Effect not exist... ERROR")
			Effects[EFFECT](hit.Parent.Humanoid)
		end

		task.wait(1)

		active = false
	end)
end)
