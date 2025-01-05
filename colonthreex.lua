repeat task.wait() until game:IsLoaded()
local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/colonthreex/colonthreex/colonthreex/ui.lua"))()

local boykisserid = "124224104795806"

local player = game.Players.LocalPlayer
local char = player.Character

local cmd
if ReplicatedStorage:FindFirstChild("HDAdminClient") then
  cmd = ReplicatedStorage:HDAdminClient.Signals.RequestCommand
else
  return
end

local tool

for i,v in player:GetDescendants() do
  if v.Name == "SyncAPI" then
    tool = v.Parent
  end
end
for i,v in game.ReplicatedStorage:GetDescendants() do
  if v.Name == "SyncAPI" then
    tool = v.Parent
  end
end
--craaa
remote = tool.SyncAPI.ServerEndpoint
function _(args)
  remote:InvokeServer(unpack(args))
end
function SetCollision(part,boolean)
  local args = {
    [1] = "SyncCollision",
    [2] = {
      [1] = {
        ["Part"] = part,
        ["CanCollide"] = boolean
      }
    }
  }
  _(args)
end
function SetAnchor(boolean,part)
  local args = {
    [1] = "SyncAnchor",
    [2] = {
      [1] = {
        ["Part"] = part,
        ["Anchored"] = boolean
      }
    }
  }
  _(args)
end
function CreatePart(cf,parent)
  local args = {
    [1] = "CreatePart",
    [2] = "Normal",
    [3] = cf,
    [4] = parent
  }
  _(args)
end
function DestroyPart(part)
  local args = {
    [1] = "Remove",
    [2] = {
      [1] = part
    }
  }
  _(args)
end
function MovePart(part,cf)
  local args = {
    [1] = "SyncMove",
    [2] = {
      [1] = {
        ["Part"] = part,
        ["CFrame"] = cf
      }
    }
  }
  _(args)
end
function Resize(part,size,cf)
  local args = {
    [1] = "SyncResize",
    [2] = {
      [1] = {
        ["Part"] = part,
        ["CFrame"] = cf,
        ["Size"] = size
      }
    }
  }
  _(args)
end
function AddMesh(part)
  local args = {
    [1] = "CreateMeshes",
    [2] = {
      [1] = {
        ["Part"] = part
      }
    }
  }
  _(args)
end

function SetMesh(part,meshid)
  local args = {
    [1] = "SyncMesh",
    [2] = {
      [1] = {
        ["Part"] = part,
        ["MeshId"] = "rbxassetid://"..meshid
      }
    }
  }
  _(args)
end
function SetTexture(part, texid)
  local args = {
    [1] = "SyncMesh",
    [2] = {
      [1] = {
        ["Part"] = part,
        ["TextureId"] = "rbxassetid://"..texid
      }
    }
  }
  _(args)
end
function SetName(part, stringg)
  local args = {
    [1] = "SetName",
    [2] = {
      [1] = part
    },
    [3] = stringg
  }

  _(args)
end
function MeshResize(part,size)
  local args = {
    [1] = "SyncMesh",
    [2] = {
      [1] = {
        ["Part"] = part,
        ["Scale"] = size
      }
    }
  }
  _(args)
end
function Weld(part1, part2,lead)
  local args = {
    [1] = "CreateWelds",
    [2] = {
      [1] = part1,
      [2] = part2
    },
    [3] = lead
  }
  _(args)

end
function SetLocked(part,boolean)
  local args = {
    [1] = "SetLocked",
    [2] = {
      [1] = part
    },
    [3] = boolean
  }
  _(args)
end
function SetTrans(part,int)
  local args = {
    [1] = "SyncMaterial",
    [2] = {
      [1] = {
        ["Part"] = part,
        ["Transparency"] = int
      }
    }
  }
  _(args)
end
function CreateSpotlight(part)
  local args = {
    [1] = "CreateLights",
    [2] = {
      [1] = {
        ["Part"] = part,
        ["LightType"] = "SpotLight"
      }
    }
  }
  _(args)
end
function SyncLighting(part,brightness)
  local args = {
    [1] = "SyncLighting",
    [2] = {
      [1] = {
        ["Part"] = part,
        ["LightType"] = "SpotLight",
        ["Brightness"] = brightness
      }
    }
  }
  _(args)
end
function Color(part,color)
  local args = {
    [1] = "SyncColor",
    [2] = {
      [1] = {
        ["Part"] = part,
        ["Color"] = color --[[Color3]],
        ["UnionColoring"] = false
      }
    }
  }
  _(args)
end
function SpawnDecal(part,side)
  local args = {
    [1] = "CreateTextures",
    [2] = {
      [1] = {
        ["Part"] = part,
        ["Face"] = side,
        ["TextureType"] = "Decal"
      }
    }
  }

  _(args)
end
function AddDecal(part,asset,side)
  local args = {
    [1] = "SyncTexture",
    [2] = {
      [1] = {
        ["Part"] = part,
        ["Face"] = side,
        ["TextureType"] = "Decal",
        ["Texture"] = "rbxassetid://".. asset
      }
    }
  }
  _(args)
end

function AddFire(part)
			local args = {
				[1] = "CreateDecorations",
				[2] = {
					[1] = {
						["Part"] = part,
						["DecorationType"] = "Fire"
					}
				}
			}
			_(args)
		end

function FireParts()
  for i,v in game.Workspace:GetDescendants() do
    spawn(function()
      SetLocked(v,false)
      AddFire(v)
    end)
  end
end

function spam(id)
	for i,v in game.workspace:GetDescendants() do
		if v:IsA("BasePart") then
			spawn(function()
				SetLocked(v,false)
				SpawnDecal(v,Enum.NormalId.Front)
				AddDecal(v,id,Enum.NormalId.Front)

				SpawnDecal(v,Enum.NormalId.Back)
				AddDecal(v,id,Enum.NormalId.Back)

				SpawnDecal(v,Enum.NormalId.Right)
				AddDecal(v,id,Enum.NormalId.Right)

				SpawnDecal(v,Enum.NormalId.Left)
				AddDecal(v,id,Enum.NormalId.Left)

				SpawnDecal(v,Enum.NormalId.Bottom)
				AddDecal(v,id,Enum.NormalId.Bottom)

				SpawnDecal(v,Enum.NormalId.Top)
				AddDecal(v,id,Enum.NormalId.Top)
			end)
		end
	end 
end

function Sky(id)
  e = char.HumanoidRootPart.CFrame.x
  f = char.HumanoidRootPart.CFrame.y
  g = char.HumanoidRootPart.CFrame.z
  CreatePart(CFrame.new(math.floor(e),math.floor(f),math.floor(g)) + Vector3.new(0,6,0),workspace)
  for i,v in game.Workspace:GetDescendants() do
    if v:IsA("BasePart") and v.CFrame.x == math.floor(e) and v.CFrame.z == math.floor(g) then
      --spawn(function()
      SetName(v,"Sky")
      AddMesh(v)
      --end)
      --spawn(function()
      SetMesh(v,"8006679977")
      SetTexture(v,id)
      --end)
      MeshResize(v,Vector3.new(100,100,100))
      SetLocked(v,true)
    end
  end
end

function Penis(player)
  char = player.Character
  for i,v in char:GetChildren() do
    pcall(function()
      SetLocked(v,false)
    end)
  end
  if player.Character:FindFirstChild("Penis") then
    return
  else


    SetAnchor(true,player.Character.HumanoidRootPart)
    spawn(function()
      CreatePart(player.Character:WaitForChild("Right Leg").CFrame * CFrame.new(-0.8,1,-0.6),player.Character)
      SetName(player.Character.Part,"Balls1")
      CreatePart(player.Character:WaitForChild("Left Leg").CFrame * CFrame.new(0.8,1,-0.6),player.Character)
      SetName(player.Character.Part,"Balls2")
    end)
    task.wait(0.2)
    repeat task.wait() until char:FindFirstChild("Balls2")
    print("done")
    spawn(function()
      CreatePart(player.Character:WaitForChild("Torso").CFrame * CFrame.new(0,-1,-1.3),player.Character)
      SetName(player.Character.Part,"Penis")
      CreatePart(player.Character:WaitForChild("Torso").CFrame * CFrame.new(0,-1,-2.5),player.Character)
      SetName(player.Character.Part,"Head1")
    end)
    repeat task.wait() until char:FindFirstChild("Head1")
    spawn(function()
      AddMesh(char.Balls1)
      AddMesh(char.Balls2)
      AddMesh(char.Head1)
      AddMesh(char.Penis)
    end)
    repeat task.wait() until char.Penis:FindFirstChild("Mesh")
    spawn(function()
      SetMesh(char.Penis,"4743972117")
      SetMesh(char.Head1,"4743972117")
      MeshResize(char.Penis,Vector3.new(0.5,0.5,3))
      MeshResize(char.Head1,Vector3.new(0.5,0.5,1))
    end)
    spawn(function()
      Weld(char.Penis,char.HumanoidRootPart,char.Penis)
      SetMesh(char.Balls1,"5697933202")
      SetMesh(char.Balls2,"5697933202")
      MeshResize(char.Balls1,Vector3.new(0.2,0.2,0.2))
      MeshResize(char.Balls2,Vector3.new(0.2,0.2,0.2))
    end)
    task.wait(0.2)
    pcall(function()
      Color(char.Balls1,char:WaitForChild("Torso").Color)
      Color(char.Balls2,char:WaitForChild("Torso").Color)
      Color(char.Penis,char:WaitForChild("Torso").Color)
      Color(char.Head1, Color3.fromRGB(255,100,100))
    end)
    task.wait(0.2)
    spawn(function()
      SetCollision(player.Character.Balls1,false)
      SetCollision(player.Character.Balls2,false)
      SetCollision(player.Character.Penis,false)
      SetCollision(player.Character.Head1,false)
    end)
    task.wait(0.2)
    spawn(function()
      Weld(char.Balls1,char.HumanoidRootPart,char.Balls1)
      Weld(char.Balls2,char.Balls1,char.Balls2)
      Weld(char.Head1,char.Penis,char.Head1)
    end)
    task.wait(0.2)
    spawn(function()
      SetAnchor(false,char.Balls1)
      SetAnchor(false,char.Balls2)
      SetAnchor(false,char.Penis)
      SetAnchor(false,char.Head1)
      SetAnchor(false,char.HumanoidRootPart)
    end)
    repeat task.wait()
      SetAnchor(false,char.HumanoidRootPart)
      SetAnchor(false,char.Balls1)
      SetAnchor(false,char.Balls2)
      SetAnchor(false,char.Penis)
      SetAnchor(false,char.Head1)
    until char.Head1.Anchored == false
  end
end
