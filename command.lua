function FindPlayer(name) -- name = string provided to look for player
	for i,v in pairs(game.Players:GetPlayers()) do  -- iterating though players
		if v.DisplayName:lower():sub(1,#name) == name:lower() then    -- checking to see if player name matches the provided string
			return v.Name
		end
		if v.Name:lower():sub(1,#name) == name:lower() then
			return v.Name
		end
	end
end
key = {
	WS = 0,
	AD = 0,
}

local UIS = game:GetService("UserInputService")
var = {
	a = 1,
	stopsus = 1,
	b = 1,
	c = 1,
	d = 1,
	e = 1,
	guiopened = false,
	f = 1,
	g = 1,
	h = 1,
	fly = 1
}
local players = game:GetService("Players")
local LP = game:GetService("Players").LocalPlayer
local Character = LP.Character
local Humanoid = Character.Humanoid
local mouse = LP:GetMouse()

--[local array = {}
--local i = 0
--while true do
--    table.insert(array,i)
--    i+=1
--    task.wait(0.0001)
--    local okk = table.maxn(array)
--    if okk == 100 then
--        break
--    end
--end

LP.Chatted:Connect(function(chat)
	local ChatArgs = string.split(chat," ")
	if ChatArgs[3] == "me" then
		ChatArgs[3] = LP.Name or game:GetService("Players").LocalPlayer.DisplayName
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "speed" then
		Humanoid.WalkSpeed = ChatArgs[3]
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "jump" then
		if Humanoid.JumpHeight then
			Humanoid.JumpHeight = ChatArgs[3]
		end
		if Humanoid.JumpPower then
			Humanoid.JumpPower = ChatArgs[3]
		end
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "sit" then
		Humanoid.Sit = true
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "move" then
		var.a = 0
		while players[FindPlayer(ChatArgs[3])].Character.HumanoidRootPart.Position and var.a == 0 do
			Humanoid:MoveTo(players[FindPlayer(ChatArgs[3])].Character.HumanoidRootPart.Position)
			task.wait(0.0000001)
		end
	elseif ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "endmove" then
		var.a = 1
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "tp" then
		Character.HumanoidRootPart.CFrame = players[FindPlayer(ChatArgs[3])].Character.HumanoidRootPart.CFrame
	end


	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "focus" then
		workspace.CurrentCamera.CameraSubject = players[FindPlayer(ChatArgs[3])].Character.PrimaryPart
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "unfocus" then
		workspace.CurrentCamera.CameraSubject = Character.PrimaryPart
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "clicktp" then
		var.b = 0
		mouse.Button1Up:Connect(function()
			if var.b == 0 then
				Character:MoveTo(mouse.Hit.Position)
			end
		end)
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "endclicktp" then
		var.b = 1
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "annoy" then
		var.c = 0
		while var.c == 0 do
			Character:MoveTo(players[FindPlayer(ChatArgs[3])].Character.HumanoidRootPart.Position)
			task.wait(0.0000000000000000000000001)
		end
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "unannoy" then
		var.c = 1
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "ff" then
		var.d = 0
		local ff = Instance.new("ForceField", Character)
		ff.Visible = true
		local rs = game:GetService("RunService")
		rs.Heartbeat:Connect(function()
			if var.d == 0 then
				Humanoid.Health = 100
			end
		end)
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "unff" then
		var.d = 1
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "reset" then
		Character.Humanoid.Health = 0
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "sus" then
		var.stopsus = 0
		local soos = nil
		local rand = math.random(1,2)
		if rand == 1 then
			soos = "us"
		end
		if rand == 2 then
			soos = "sus"
		end
		local themessage = string.gsub(ChatArgs[3],ChatArgs[3].sub(math.random(1,#ChatArgs[3]), math.random(1,#ChatArgs[3])),soos)
		local checkchat = coroutine.create(function()
			LP.Chatted:Connect(function(chat)
				if chat == themessage then
					var.stopsus = 1
				end
			end)
		end)

		if var.stopsus == 0 then
			coroutine.resume(checkchat)
			game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(themessage, "All")
		end
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "spin" then
		var.e = 0
		while var.e == 0 do
			Character:SetPrimaryPartCFrame(Character.PrimaryPart.CFrame * CFrame.Angles(0,math.rad(1 * (tonumber(ChatArgs[3]) / 2)),0))
			wait()
		end
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "endspin" then
		var.e = 1
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "esp" then
		var.f = 0
		while var.f == 0 do
			wait()
			for i, v in pairs(workspace:GetDescendants()) do
				if v:IsA("Part") then
					v.Transparency = 0.5
				end
			end
			for i, v in pairs(workspace:GetChildren()) do
				if v:IsA("Part") then
					v.Transparency = 0.5
				end
			end
			for i, v in pairs(players:GetChildren()) do
				if v.Name ~= LP.Name then
					for _,bodyparts in pairs(v.Character:GetChildren()) do
						if bodyparts:IsA("Humanoid") then
							bodyparts.NameOcclusion = Enum.NameOcclusion.NoOcclusion
							bodyparts.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOn
							bodyparts.NameDisplayDistance = 99999999999999999999999999999999
							bodyparts.HealthDisplayDistance = 99999999999999999999999999999999
						end
						if bodyparts:IsA("MeshPart") or bodyparts:IsA("Part") then
							if not bodyparts:FindFirstChild("SelectionBox") then
								Instance.new("SelectionBox", bodyparts).Adornee = bodyparts
								bodyparts.Transparency = 0
							end
						end
					end
				end
			end
			for i, v in pairs(Character:GetChildren()) do
				if v:IsA("Part") or v:IsA("MeshPart") then
					if v.Name ~= "HumanoidRootPart" then
						v.Transparency = 0
					elseif v.Name == "HumanoidRootPart" then
						v.Transparency = 1
					end
				end
			end
		end
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "endesp" then
		var.f = 1
		for i, v in pairs(workspace:GetDescendants()) do
			if v:IsA("Part") then
				v.Transparency = 0
			end
		end
		for i, v in pairs(workspace:GetChildren()) do
			if v:IsA("Part") then
				v.Transparency = 0
			end
		end
		for i, v in pairs(players:GetChildren()) do
			if v.Name ~= LP.Name then
				for _,bodyparts in pairs(v.Character:GetChildren()) do
					if bodyparts:IsA("Humanoid") then
						bodyparts.HealthDisplayType = Enum.HumanoidHealthDisplayType.DisplayWhenDamaged
						bodyparts.NameDisplayDistance = 100
						bodyparts.HealthDisplayDistance = 100
					end
					if bodyparts:IsA("MeshPart") or bodyparts:IsA("Part") then
						for a,p in pairs(bodyparts:GetChildren()) do
							if p:IsA("SelectionBox") then
								p:Destroy()
							end
						end
					end
				end
			end
		end
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "spam" then
		var.h = 0
		while var.h == 0 do
			game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(ChatArgs[3], "All")
			wait(ChatArgs[4])	
		end
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "endspam" then
		var.h = 1
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "blockify" then
		if Character:FindFirstChild("Head").Mesh then
			Character:FindFirstChild("Head").Mesh:Destroy()
		end
		if Character:WaitForChild("CharacterMesh") then
			for i, v in pairs(Character:GetChildren()) do
				if v.Name == "CharacterMesh" and v:IsA("CharacterMesh") then
					v:Destroy()
				end
			end
		end
	end
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "fly" then
		var.fly = 0
		local BodyVelocity = Instance.new("BodyVelocity", game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))
		local DefaultNumber = ChatArgs[3]
        Humanoid.PlatformStand = true
		while var.fly == 0 do
			wait()
			UIS.InputBegan:Connect(function(input)
				if input.KeyCode == Enum.KeyCode.W then
					key.WS = 1
				end
				if input.KeyCode == Enum.KeyCode.A then
					key.AD = 1
				end
				if input.KeyCode == Enum.KeyCode.S then
					key.WS = -1
				end
				if input.KeyCode == Enum.KeyCode.D then
					key.AD = -1
				end
			end)
			UIS.InputEnded:Connect(function(input)
				if input.KeyCode == Enum.KeyCode.W then
					key.WS = 0
				end
				if input.KeyCode == Enum.KeyCode.A then
					key.AD = 0
				end
				if input.KeyCode == Enum.KeyCode.S then
					key.WS = 0
				end
				if input.KeyCode == Enum.KeyCode.D then
					key.AD = 0
				end
			end)
            Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.lookAt(Character:FindFirstChild("HumanoidRootPart").Position, Character:FindFirstChild("HumanoidRootPart").Position + workspace.CurrentCamera.CFrame.LookVector)
			BodyVelocity.Velocity = workspace.CurrentCamera.CFrame.LookVector * Vector3.new(key.WS * DefaultNumber,key.WS * DefaultNumber,key.WS * DefaultNumber)
		end
	end
	
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "unfly" then
		var.fly = 1
        Humanoid.PlatformStand = false
		if Character:FindFirstChild("HumanoidRootPart").BodyVelocity then
			Character:FindFirstChild("HumanoidRootPart").BodyVelocity:Destroy()
		end
		for i, v in ipairs(key) do
			key[i] = 0
		end
	end
	LP.CharacterAdded:Connect(function()
		var.guiopened = false
	end)
	if ChatArgs[1]:lower() == "/e" and ChatArgs[2]:lower() == "cmds" then
		if var.guiopened == false then
			var.guiopened = true
			--EXTRA VARIABLES--
			local Comfy = true
			local Sleek = false

			--PROPERTES--

			local Dal = Instance.new("ScreenGui")
			Dal.Name = "DalGui"
			Dal.ResetOnSpawn = true
			Dal.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
			Dal.IgnoreGuiInset = true


			--COMMANDS
			local ImageButton1 = Instance.new("ImageButton")
			ImageButton1.Parent = Dal
			ImageButton1.Transparency = 1
			ImageButton1.ImageTransparency = 1
			ImageButton1.BackgroundColor3 = Color3.fromRGB(31,31,31)
			ImageButton1.Position = UDim2.new(0.025, 0,0.89, 0)
			ImageButton1.Size = UDim2.new(0, 35,0, 35)
			ImageButton1.Image = "http://www.roblox.com/asset/?id=7059346373"
			ImageButton1.ImageColor3 = Color3.new(255,255,255)

			local TextButton1 = Instance.new("TextButton")
			TextButton1.Parent = Dal
			TextButton1.Visible = false
			TextButton1.BackgroundColor3 = Color3.fromRGB(31,31,31)
			TextButton1.Position = UDim2.new(0.025, 0,0.89, 0)
			TextButton1.Size = UDim2.new(0, 35,0, 35)
			TextButton1.Text = "CMDS"
			TextButton1.Font = Enum.Font.FredokaOne
			TextButton1.TextSize = 10
			TextButton1.TextColor3 = Color3.fromRGB(255,255,255)

			local UICorner1 = Instance.new("UICorner")
			UICorner1.Parent = ImageButton1
			UICorner1.CornerRadius = UDim.new(0, 999999999)

			local Frame1 = Instance.new("Frame")
			Frame1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Frame1.Parent = Dal
			Frame1.Active = true
			Frame1.Draggable = true
			Frame1.Transparency = 0.5
			Frame1.Size = UDim2.new(0, 250,0, 350)
			--Frame1.Position = UDim2.new(0.5, -218,0.5, -146) EndTweenPosition
			Frame1.Position = UDim2.new(1.5, -125,0.5, -175) -- StartTweenPosition
			Frame1.ZIndex = -1
			Frame1.Name = "Commands"

			local UICorner2 = Instance.new("UICorner")
			UICorner2.Parent = Frame1

			local Frame2 = Instance.new("Frame")
			Frame2.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			Frame2.Parent = Frame1
			Frame2.Active = true
			Frame2.Size = UDim2.new(0, 230,0, 277)
			Frame2.Position = UDim2.new(0.039, 0,0.179, 0)
			Frame2.ZIndex = 1

			local UICorner3 = Instance.new("UICorner")
			UICorner3.Parent = Frame2

			local ScrollingFrame1 = Instance.new("ScrollingFrame")
			ScrollingFrame1.Parent = Frame2
			ScrollingFrame1.BackgroundColor3 = Color3.fromRGB(31,31,31)
			ScrollingFrame1.BorderSizePixel = 0
			ScrollingFrame1.Position = UDim2.new(0.03, 0,0.025, 0)
			ScrollingFrame1.Size = UDim2.new(0, 216,0, 263)
			ScrollingFrame1.CanvasSize = UDim2.new(0, 0,4.71, 0)

			local UIListLayout1 = Instance.new("UIListLayout")
			UIListLayout1.Parent = ScrollingFrame1
			UIListLayout1.Padding = UDim.new(0, 15)
			UIListLayout1.HorizontalAlignment = Enum.HorizontalAlignment.Center

			local UIPadding1 = Instance.new("UIPadding")
			UIPadding1.Parent = ScrollingFrame1
			UIPadding1.PaddingTop = UDim.new(0,10)

			local TextLabel1 = Instance.new("TextLabel")
			TextLabel1.Parent = Frame1
			TextLabel1.Text = "Commands"
			TextLabel1.TextScaled = true
			TextLabel1.TextColor3 = Color3.fromRGB(255,255,255)
			TextLabel1.Font = Enum.Font.FredokaOne
			TextLabel1.Position = UDim2.new(0.1, 0,0.18, 0) -- StartTweenPosition
			--UDim2.new(0.271, 0,0.031, 0) EndTweenPosition
			TextLabel1.Size = UDim2.new(0, 200,0, 33)
			TextLabel1.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			TextLabel1.ZIndex = 0

			local Frame3 = Instance.new("Frame")
			Frame3.Parent = ScrollingFrame1
			Frame3.BackgroundTransparency = 1
			Frame3.Size = UDim2.new(0, 178,0, 50)

			local TextLabel2 = Instance.new("TextLabel")
			TextLabel2.Parent = Frame3
			TextLabel2.BackgroundColor3 =  Color3.new(108, 108, 108)
			TextLabel2.Position = UDim2.new(0,0,0,0)
			TextLabel2.Size = UDim2.new(0, 178,0, 50)
			TextLabel2.Text = ""
			TextLabel2.Name = "background"

			local UICorner4 = Instance.new("UICorner")
			UICorner4.Parent = TextLabel2
			UICorner4.CornerRadius = UDim.new(0, 10)

			local TextLabel3 = Instance.new("TextLabel")
			TextLabel3.Parent = Frame3
			TextLabel3.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
			TextLabel3.Position = UDim2.new(0,0,0,0)
			TextLabel3.Size = UDim2.new(0, 178,0, 50)
			TextLabel3.Font = Enum.Font.FredokaOne
			TextLabel3.Text = "/e speed (int)"
			TextLabel3.TextSize = 14
			TextLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)

			local UICorner5 = Instance.new("UICorner")
			UICorner5.Parent = TextLabel1
			UICorner5.CornerRadius = UDim.new(0, 999999999)

			local UICorner6 = Instance.new("UICorner")
			UICorner6.Parent = TextLabel3

			local commands = {
				"/e jump (int)",
				"/e sit",
				"/e move (player)",
				"/e endmove",
				"/e tp (player)",
				"/e focus (player)",
				"/e unfocus",
				"/e clicktp",
				"/e endclicktp",
				"/e annoy (player)",
				"/e unannoy",
				"/e ff",
				"/e unff",
				"/e reset",
				"/e sus (str)",
				"/e spin (int)",
				"/e endspin",
				"/e cmds",
				"/e esp",
				"/e endesp",
				"/e blockify"
			}

			for i, v in ipairs(commands) do
				local frame = Frame3:Clone()
				frame.Parent = ScrollingFrame1
				frame.Name = "Frame" .. i
				frame.TextLabel.Text = v
			end
			local co = coroutine.create(function()
				task.wait(1)
				while ImageButton1.Transparency > 0 and ImageButton1.ImageTransparency > 0 do
					ImageButton1.Transparency  -= 0.1
					ImageButton1.ImageTransparency -= 0.1
					task.wait(0.05)
				end
			end)

			--SETTINGS--
			local Frame4 = Frame1:Clone()
			Frame4.Parent = Dal
			Frame4.TextLabel.Text = "Settings"
			Frame4.Name = "Settings"
			Frame4.TextLabel.Position = UDim2.new(0.1, 0,0.04, 0)
			Frame4.Position = UDim2.new(-0.2, -125,0.5, -175)

			local Frame5 = Frame4.Frame
			for i, v in pairs(Frame5:GetChildren()) do
				if not v:IsA("UICorner") then
					v:Destroy()
				end
			end
			local UIPadding2 = Instance.new("UIPadding")
			UIPadding2.Parent = Frame5
			UIPadding2.PaddingTop = UDim.new(0, 10)

			local UITableLayout1 = Instance.new("UITableLayout")
			UITableLayout1.Parent = Frame5
			UITableLayout1.HorizontalAlignment = Enum.HorizontalAlignment.Center

			local Frame6 = Instance.new("Frame")
			Frame6.Parent = Frame5
			Frame6.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
			Frame6.Size = UDim2.new(0, 210,0, 123)
			Frame6.BackgroundTransparency = 1

			local TextLabel4 = Instance.new("TextLabel")
			TextLabel4.Parent = Frame6
			TextLabel4.Size = UDim2.new(0, 210,0, 123)
			TextLabel4.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
			TextLabel4.Font = Enum.Font.FredokaOne
			TextLabel4.Text = ""

			local UICorner7 = Instance.new("UICorner")
			UICorner7.Parent = TextLabel4

			local UICorner8 = Instance.new("UICorner")
			UICorner8.Parent = TextButton1
			UICorner8.CornerRadius = UDim.new(0, 999999999)

			local Frame7 = Instance.new("Frame")
			Frame7.Parent = TextLabel4
			Frame7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame7.Position = UDim2.new(0, 0,0, 35)
			Frame7.Size = UDim2.new(1, 0,0, 1)
			Frame7.BackgroundTransparency = 0.85
			Frame7.BorderSizePixel = 0
			Frame7.ZIndex = 2

			local TextLabel5 = Instance.new("TextLabel")
			TextLabel5.Parent = TextLabel4
			TextLabel5.BackgroundTransparency = 1
			TextLabel5.Position = UDim2.new(0, 0,0.049, 0)
			TextLabel5.Size = UDim2.new(0, 210,0, 22)
			TextLabel5.Font = Enum.Font.FredokaOne
			TextLabel5.Text = "Themes"
			TextLabel5.TextScaled = true
			TextLabel5.TextColor3 = Color3.fromRGB(255,255,255)

			local TextLabel6 = Instance.new("TextLabel")
			TextLabel6.Parent = TextLabel4
			TextLabel6.BackgroundTransparency = 1
			TextLabel6.BorderSizePixel = 0
			TextLabel6.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
			TextLabel6.Name = "Comfy"
			TextLabel6.Position = UDim2.new(0.081, 0,0.423, 0)
			TextLabel6.Size = UDim2.new(0, 193,0, 17)
			TextLabel6.Font = Enum.Font.FredokaOne
			TextLabel6.Text = "Comfy"
			TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel6.TextScaled = true
			TextLabel6.TextColor3 = Color3.fromRGB(255,255,255)


			local rbxassets = {
				"rbxassetid://13165414408",
				"rbxassetid://13165415560",
				"rbxassetid://13165416738",
				"rbxassetid://13165417758",
				"rbxassetid://13165419158",
				"rbxassetid://13165420461",
				"rbxassetid://13165441605",
				"rbxassetid://13165443037",
				"rbxassetid://13165443855",
				"rbxassetid://13165444794",
				"rbxassetid://13165445644"
			}

			local ImageButton2 = Instance.new("ImageButton")
			ImageButton2.Parent = TextLabel4
			ImageButton2.BackgroundTransparency = 1
			ImageButton2.Position = UDim2.new(0.843, 0,0.423, 0)
			ImageButton2.Size = UDim2.new(0, 19,0, 19)
			ImageButton2.Image = rbxassets[#rbxassets]
			local rbxassetsbackwards = {}
			for i,v in ipairs(rbxassets) do
				rbxassetsbackwards[i] = rbxassets[(#rbxassets - i) + 1]
			end

			local TextLabel7 = TextLabel6:Clone()
			TextLabel7.Parent = TextLabel4
			TextLabel7.Name = "Sleek"
			TextLabel7.Text = "Sleek"
			TextLabel7.Position = UDim2.new(0.081, 0,0.659, 0)

			local ImageButton3 = ImageButton2:Clone()
			ImageButton3.Parent = TextLabel4
			ImageButton3.Position = UDim2.new(0.843, 0,0.65, 0)
			ImageButton3.Image = rbxassets[1]
			ImageButton2.MouseButton1Up:Connect(function()
				if ImageButton2.Image == rbxassets[1] or ImageButton2.Image == rbxassetsbackwards[#rbxassetsbackwards] then
					Sleek = false
					Comfy = true
					coroutine.resume(coroutine.create(function()
						for i, v in ipairs(rbxassetsbackwards) do
							ImageButton3.Image = v
							task.wait(0.01)
						end
					end))
					for i, v in ipairs(rbxassets) do
						ImageButton2.Image = v
						task.wait(0.01)
					end
				end
			end)

			ImageButton3.MouseButton1Up:Connect(function()
				if ImageButton2.Image == rbxassets[#rbxassets] or ImageButton2.Image == rbxassetsbackwards[1] then
					Comfy = false
					Sleek = true
					coroutine.resume(coroutine.create(function()
						for i, v in ipairs(rbxassetsbackwards) do
							ImageButton2.Image = v
							task.wait(0.01)
						end
					end))
					for i, v in ipairs(rbxassets) do
						ImageButton3.Image = v
						task.wait(0.01)
					end
				end
			end)


			if Sleek == true and ImageButton2.Image == rbxassets[#rbxassets] then
				for i, v in ipairs(rbxassetsbackwards) do
					ImageButton2.Image = v
					task.wait(0.01)
				end
			end
			if Comfy == true and ImageButton3.Image == rbxassets[#rbxassets] then
				for i, v in ipairs(rbxassetsbackwards) do
					ImageButton2.Image = v
					task.wait(0.01)
				end
			end
			--TWEENS--
			local TweenService = game:GetService("TweenService")
			local WindowInSlow = TweenInfo.new(
				2,
				Enum.EasingStyle.Exponential,
				Enum.EasingDirection.InOut
			)
			local LogoUp = TweenInfo.new(
				1,
				Enum.EasingStyle.Cubic,
				Enum.EasingDirection.InOut
			)
			local WindowOut = TweenInfo.new(
				0.5,
				Enum.EasingStyle.Exponential,
				Enum.EasingDirection.InOut
			)
			local WindowInFast = TweenInfo.new(
				0.5,
				Enum.EasingStyle.Exponential,
				Enum.EasingDirection.InOut
			)
			coroutine.resume(co)
			TweenService:Create(Frame1,WindowInSlow,{Position = UDim2.new(0.5, -125,0.5, -175)}):Play()
			wait(2)
			TweenService:Create(TextLabel1,LogoUp,{Position = UDim2.new(0.1, 0,0.04, 0)}):Play()


			--EVENTS--
			--
			for i, v in pairs(ScrollingFrame1:GetChildren()) do
				if v:IsA("Frame") then
					v:FindFirstChild("background").MouseEnter:Connect(function()
						v:FindFirstChild("background"):TweenSize(
							UDim2.new(0, 178,0, 54),
							Enum.EasingDirection.InOut,
							Enum.EasingStyle.Quad,
							0.1
						)
					end)

					v:FindFirstChild("background").MouseLeave:Connect(function()
						v:FindFirstChild("background"):TweenSize(
							UDim2.new(0, 178,0, 50),
							Enum.EasingDirection.InOut,
							Enum.EasingStyle.Quad,
							0.1
						)
					end)
				end
			end
			--{0, 206},{0, 56} is text label border
			-- regular {0, 200},{0, 50}

			ImageButton1.MouseButton1Up:Connect(function()
				TweenService:Create(Frame1,WindowOut,{Position = UDim2.new(1.5, -125,0.5, -175)}):Play()
				wait(0.5)
				TweenService:Create(Frame4,WindowInFast,{Position = UDim2.new(0.5, -125,0.5, -175)}):Play()
				ImageButton1.Visible = false
				TextButton1.Visible = true
			end)

			TextButton1.MouseButton1Up:Connect(function()
				TweenService:Create(Frame4,WindowOut,{Position = UDim2.new(-0.2, -125,0.5, -175)}):Play()
				wait(0.5)
				TweenService:Create(Frame1,WindowInFast,{Position = UDim2.new(0.5, -125,0.5, -175)}):Play()
				ImageButton1.Visible = true
				TextButton1.Visible = false
			end)
		end
	end
end)

local msg = Instance.new("Message")
msg.Text = "Welcome to DalGui! Type \"/e cmds\" in the chat to check out the commands!"
msg.Parent = workspace
wait(5)
msg:Destroy()
