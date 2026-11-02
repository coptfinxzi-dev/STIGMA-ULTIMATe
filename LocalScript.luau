local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
repeat task.wait() until game:IsLoaded()
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "StigmaFroud"
gui.ResetOnSpawn = false
gui.DisplayOrder = 999
gui.Parent = player:WaitForChild("PlayerGui")

local trajectory = Instance.new("ImageLabel")
trajectory.Name = "trajectory"
trajectory.Parent = gui
trajectory.BackgroundTransparency = 1
trajectory.Position = UDim2.new(0.454, 0, 0.430, 0)
trajectory.Size = UDim2.fromOffset(110, 110)
trajectory.Image = "rbxassetid://7102118272"

local R = Instance.new("ImageLabel")
R.Name = "R"
R.Parent = gui
R.BackgroundTransparency = 1
R.Position = UDim2.new(0.454, 0, 0.430, 0)
R.Size = UDim2.fromOffset(110, 110)
R.ZIndex = 3
R.Image = "rbxassetid://7102117818"

local Earth = Instance.new("ImageLabel")
Earth.Name = "Earth"
Earth.Parent = R
Earth.BackgroundTransparency = 1
Earth.Position = UDim2.new(0.405, 0, 0.407, 0)
Earth.Size = UDim2.fromOffset(20, 20)
Earth.ZIndex = 4
Earth.Image = "rbxassetid://78137783929126"

local Green = Instance.new("ImageLabel")
Green.Name = "Green"
Green.Parent = gui
Green.BackgroundTransparency = 1
Green.Position = UDim2.new(0.454, 0, 0.430, 0)
Green.Size = UDim2.fromOffset(110, 110)
Green.ZIndex = 6
Green.Image = "rbxassetid://75554667916597"
Green.ImageTransparency = 1

local target = UDim2.new(0.02, 0, 0.78, 0)

local tweenInfo = TweenInfo.new(
	1,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut
)

task.wait(3)

for _, v in ipairs({trajectory, R, Green}) do
	TweenService:Create(v, tweenInfo, {
		Position = target
	}):Play()
end

task.spawn(function()
	while gui.Parent do
		trajectory.Rotation += 0.3
		task.wait(0.01)
	end
end)

task.spawn(function()
	local angle = 0
	local origin = Earth.Position
	local distance = 55

	while gui.Parent do
		angle += 0.02

		Earth.Position = origin + UDim2.fromOffset(
			math.cos(angle) * distance,
			math.sin(angle) * distance
		)

		task.wait()
	end
end)

task.spawn(function()
	task.wait(2)

	while gui.Parent do
		for _, transparency in ipairs({0, 1, 0, 1}) do
			local tween = TweenService:Create(
				Green,
				TweenInfo.new(0.5),
				{ImageTransparency = transparency}
			)

			tween:Play()
			tween.Completed:Wait()
			task.wait(0.3)
		end

		task.wait(4)
	end
end)