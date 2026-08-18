local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScreenGui2"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local screengui2 = Instance.new("Frame")
screengui2.Name = "screengui2"
screengui2.Parent = ScreenGui
screengui2.Position = UDim2.new(0, 150, 0, 70)
screengui2.Size = UDim2.new(0, 240, 0, 300)
screengui2.BackgroundColor3 = Color3.fromRGB(30, 41, 59)
screengui2.BackgroundTransparency = 0.4
screengui2.BorderSizePixel = 0

local TextButton3 = Instance.new("TextButton")
local autobuyIsPressed = false
TextButton3.Name = "TextButton3"
TextButton3.Parent = ScreenGui
TextButton3.ZIndex = 2
TextButton3.Position = UDim2.new(0, 155, 0, 100)
TextButton3.Size = UDim2.new(0, 75, 0, 25)
TextButton3.BackgroundColor3 = Color3.fromRGB(181, 18, 18)
TextButton3.BorderSizePixel = 0
local TextButton3Corner = Instance.new("UICorner")
TextButton3Corner.CornerRadius = UDim.new(0, 4)
TextButton3Corner.Parent = TextButton3
TextButton3.Text = "Autobuy"
TextButton3.TextSize = 18
TextButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton3.Font = Enum.Font.SourceSansBold
TextButton3.MouseButton1Click:Connect(function()
	if autobuyIsPressed == true then
		autobuyIsPressed = false
		TextButton3.BackgroundColor3 = Color3.fromRGB(181, 18, 18)
	else
		autobuyIsPressed = true
		TextButton3.BackgroundColor3 = Color3.fromRGB(30, 171, 27)
	end
end)

local ScrollingFrame4 = Instance.new("ScrollingFrame")
ScrollingFrame4.Name = "ScrollingFrame4"
ScrollingFrame4.Parent = ScreenGui
ScrollingFrame4.Position = UDim2.new(0, 170, 0, 150)
ScrollingFrame4.Size = UDim2.new(0, 200, 0, 200)
ScrollingFrame4.BackgroundColor3 = Color3.fromRGB(51, 65, 85)
ScrollingFrame4.BorderSizePixel = 0

local hwareitems = {"Old Laptop", "Office PC", "Gaming PC", "Mining Rig", "GPU Server", "GPU Rack", "Server Tower", "TPU Pod", "Inference Rack", "Liquid Cluster"}
for i, v in pairs(hwareitems) do
	local text = Instance.new("TextButton")
	local isOn = false
	text.Name = v
	text.Size = UDim2.new(0, 175, 0, 25)
	text.Position = UDim2.new(0.03,0,0.02*(i-0.9), 0)
	text.BackgroundColor3 = Color3.fromRGB(181, 18, 18)
	text.Text = v
	text.Parent = ScrollingFrame4
	text.MouseButton1Click:Connect(function()
		if isOn == true then
			isOn = false
			text.BackgroundColor3 = Color3.fromRGB(181, 18, 18)
		else
			isOn = true
			text.BackgroundColor3 = Color3.fromRGB(30, 171, 27)
		end
	end)
end

local closeButton = Instance.new("TextButton")
closeButton.Position = UDim2.new(0, 207, 0, 2)
closeButton.Size = UDim2.new(0, 30, 0, 20)
closeButton.Text = "X"
closeButton.Parent = ScreenGui:WaitForChild("screengui2")
closeButton.MouseButton1Click:Connect(function()
	closeButton.Parent.Parent:Destroy()
end)

while true do
	if autobuyIsPressed == true then
		for index, value in pairs(ScrollingFrame4:GetChildren()) do
			if value.BackgroundColor3 == Color3.fromRGB(30, 171, 27) then
				game:GetService("ReplicatedStorage").Remotes.BuyItem:InvokeServer("Hardware",value.Name)
				print(value)
			end
		end
		print("autobuy IS pressed")
	end
wait(0.5)
end
