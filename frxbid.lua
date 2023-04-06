game.StarterGui:SetCore("SendNotification", {
    Title =  ".gg/shs";
    Text = "Welcome!";
    Icon = "rbxassetid://12319510751";
    Duration = "0.1";
})

_G.enable = false 
_G.method = "MousePos"

if game.PlaceId == 2788229376 then
    _G.method = "MousePos"
end


---------------------------------------------------------------
local rs = game:GetService("RunService")
local localPlayer = game.Players.LocalPlayer
local mouse = localPlayer:GetMouse()
local target;



function getgun()
    for i,v in pairs(target.Character:GetChildren()) do
        if v and (v:FindFirstChild("Default") or v:FindFirstChild("Handle") )then
            return v
        end
    end
end

function sendnotifi(message)


    game.StarterGui:SetCore("SendNotification", {
        Title    = ".gg/shs";
        Text     = message;
        Icon     = "rbxassetid://12319510751";
        Duration = "0.1";
    })
   
    end


function get_closet()
    local a = math.huge
    local b;



    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") and  v.Character:FindFirstChild("HumanoidRootPart")  then
            local c = game.Workspace.CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local d = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(c.X, c.Y)).Magnitude

            if a > d then
  b = v
  a = d
            end
        end
    end

    return b
end

--- 
mouse.KeyDown:Connect(function(z)
    if z == ToggleTracer then
        if _G.enable == false then
            _G.enable = true
            sendnotifi("enabled !")
        elseif _G.enable == true then
            _G.enable = false 
            sendnotifi("disabled !")
        end
    end
end)

mouse.KeyDown:Connect(function(z)
    if z == SwitchUsers then
        target = get_closet()
        sendnotifi("targeting: "..tostring(target.Name))
    end
end)
---

-- minified it 
local a=Instance.new("Beam")a.Segments=1;a.Width0=0.5;a.Width1=0.5;a.Color=ColorSequence.new(getgenv().TracerColor)a.FaceCamera=true;local b=Instance.new("Attachment")local c=Instance.new("Attachment")a.Attachment0=b;a.Attachment1=c;a.Parent=workspace.Terrain;b.Parent=workspace.Terrain;c.Parent=workspace.Terrain

task.spawn(function()
    rs.RenderStepped:Connect(function()
 
    local character = localPlayer.Character
        if not character then
        a.Enabled = false
        return
    end


 



    if _G.enable  and getgun() and target.Character:FindFirstChild("BodyEffects") and target.Character:FindFirstChild("Head")  then
        a.Enabled = true
        b.Position =  target.Character:FindFirstChild("Head").Position
        c.Position = target.Character.BodyEffects[_G.method].Value ---edit this if some random ass game got some weird ass other name :palingface
    else
        a.Enabled = false
    end

    end)
end)

--Bind
--------------------------------------------------
getgenv().VelocityChanger = false
getgenv().Velocity        = Vector3.new(VelocityX, VelocityY, VelocityZ)
getgenv().MouseAA_Toggle  = false
--------------------------------------------------
local Players     = game:GetService("Players")
local RunService  = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local LocalPlayer = game:GetService("Players").LocalPlayer
local Bullshit = LocalPlayer:GetMouse()
local Character   = LocalPlayer.Character
local RootPart    = Character:FindFirstChild("HumanoidRootPart")


local Heartbeat, RStepped, Stepped = RunService.Heartbeat, RunService.RenderStepped, RunService.Stepped

LocalPlayer.CharacterAdded:Connect(function(NewCharacter)
    Character = NewCharacter
end)

local RVelocity, YVelocity = nil, 0.1
-------------------------------------------------
--Mouse AA 
function MouseAA()
    local mouse = game.Players.LocalPlayer:GetMouse()
    game:GetService("RunService").Heartbeat:Connect(
        function()
            if MouseAA_Toggle ~= false then
                local vel = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
    
                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity =
                    Vector3.new(mouse.Hit.x, mouse.Hit.y, mouse.Hit.z)
    
                game:GetService("RunService").RenderStepped:Wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = vel
            end
        end
    )
end

--Notify Function
--------------------------------------------------
function sendnotifi(message)


    game.StarterGui:SetCore("SendNotification", {
        Title    = ".gg/shs";
        Text     = message;
        Icon     = "rbxassetid://12319510751";
        Duration = "0.1";
    })
   
    end
--Notify
-------------------------------------------------
    Bullshit.KeyDown:Connect(function(input)
    if input == string.lower(AntiLockKeyBind) then
        pcall(function()
            if VelocityChanger == false then
                sendnotifi("Antilock; off.")
            elseif VelocityChanger == true then
                sendnotifi("Antilock; on. ["..VelocityX..","..VelocityY..","..VelocityZ.."] !")
            end
        end)
        end
    end)
    
--Velocity Function
-------------------------------------------------

Bullshit.KeyDown:Connect(function(input)
if not (UIS:GetFocusedTextBox()) then
    if input == string.lower(AntiLockKeyBind) then
        pcall(function()
            if VelocityChanger then
                VelocityChanger = false
            else
                VelocityChanger = true
                task.spawn(function()
                        while VelocityChanger do
                            print("Running")
                            if (not RootPart) or (not RootPart.Parent) or (not RootPart.Parent.Parent) then
                                repeat task.wait() RootPart = Character:FindFirstChild("HumanoidRootPart") until RootPart ~= nil
                            else
                                RVelocity = RootPart.Velocity
    
                                RootPart.Velocity = type(Velocity) == "vector" and Velocity or Velocity(RVelocity)
    
                                RStepped:wait()
    
                                RootPart.Velocity = RVelocity
                            end
                        Heartbeat:wait()
                    end
                end)
            end
        end)
        end
    end
end)





Bullshit.KeyDown:Connect(function(input)
    if input == string.lower(MouseAntiLockKeybind) then
        pcall(function()
            if MouseAA_Toggle then
                MouseAA_Toggle = false
                sendnotifi("MouseAA; off")
            elseif not MouseAA_Toggle then
                MouseAA_Toggle = true
                sendnotifi("MouseAA; on")
                    MouseAA()
                    task.wait()
            end
        end)
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------
local P1000ToggleKey = DeSyncKey -- Change that to whatever keybind: "t"


--[[

    Standing still will trick the hitbox, you won't be able to get hit.


    DO NOT EDIT BEYOND THIS POINT IF YOU DON'T UNDERSTAND WHAT IS GOING ON.
    
    ORIGINAL SOURCE PUT INTO SKID FRIENDLY FORMAT TAKE WHAT YOU LIKE AND MAKE MANY MORE OBLIVITIES CLONES WITH THIS OR EVEN YOUR VERY OWN DIY OBLIVITY!
    
    AND REMEMBER TO SAY, SO LOOOOONG OBLIVITYYYYYY!!!


--]]


--// Services
checkcaller = checkcaller
newcclosure = newcclosure
hookmetamethod = hookmetamethod

local PastedSources = false
local BruhXD = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Bullshit = LocalPlayer:GetMouse()


--// Toggles
Bullshit.KeyDown:Connect(function(SayNoToOblivity)
    if SayNoToOblivity == string.lower(P1000ToggleKey) then
        pcall(function()
            if PastedSources == false then
                PastedSources = true
                sendnotifi("DeSync ON")
            elseif PastedSources == true then
                PastedSources = false
                sendnotifi("DeSync OFF")
            end
        end)
    end
end)

Bullshit.KeyDown:Connect(function(SayNoToOblivity)
    if SayNoToOblivity == ("=") then
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer) 
    end
end)


--// Desync_Source
function RandomNumberRange(a)
    return math.random(-a * 100, a * 100) / 100
end

function RandomVectorRange(a, b, c)
    return Vector3.new(RandomNumberRange(a), RandomNumberRange(b), RandomNumberRange(c))
end


local DesyncTypes = {}
BruhXD.Heartbeat:Connect(function()
    if PastedSources == true then
        DesyncTypes[1] = LocalPlayer.Character.HumanoidRootPart.CFrame
        DesyncTypes[2] = LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity

        local SpoofThis = LocalPlayer.Character.HumanoidRootPart.CFrame

        SpoofThis = SpoofThis * CFrame.new(Vector3.new(0, 0, 0))
        SpoofThis = SpoofThis * CFrame.Angles(math.rad(RandomNumberRange(180)), math.rad(RandomNumberRange(180)), math.rad(RandomNumberRange(180)))

        LocalPlayer.Character.HumanoidRootPart.CFrame = SpoofThis

        LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(1, 1, 1) * 16384

        BruhXD.RenderStepped:Wait()

        LocalPlayer.Character.HumanoidRootPart.CFrame = DesyncTypes[1]
        LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = DesyncTypes[2]
    end
end)


--// Hook_CFrame
local XDDDDDD = nil
XDDDDDD = hookmetamethod(game, "__index", newcclosure(function(self, key)
    if PastedSources == true then
        if not checkcaller() then
            if key == "CFrame" and PastedSources == true and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                if self == LocalPlayer.Character.HumanoidRootPart then
                    return DesyncTypes[1] or CFrame.new()
                elseif self == LocalPlayer.Character.Head then
                    return DesyncTypes[1] and DesyncTypes[1] + Vector3.new(0, LocalPlayer.Character.HumanoidRootPart.Size / 2 + 0.5, 0) or CFrame.new()
                end
            end
        end
    end
    return XDDDDDD(self, key)
end))
