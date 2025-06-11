-- Minimal Video Player Script
-- NOTE: Executor must support `writefile`, `getcustomasset`, and `VideoFrame`

if not getcustomasset or not writefile or not game:HttpGet then
    return warn("Executor does not support required functions.")
end

-- UI Setup
local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "VideoPlayer"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

local video = Instance.new("VideoFrame")
video.Parent = gui
video.Size = UDim2.new(1, 0, 1, 0)
video.Position = UDim2.new(0, 0, 0, 0)
video.BackgroundTransparency = 1
video.Looped = true
video.Playing = true
video.Volume = 5

-- Download and play video
local fileId = "1SJmcZDcYDwUHBalRPBuOufMRYdqvAiqp"
local downloadUrl = "https://drive.google.com/uc?export=download&id=" .. fileId
local localFile = "yourvideo.mp4"

writefile(localFile, game:HttpGet(downloadUrl))
video.Video = getcustomasset(localFile)
