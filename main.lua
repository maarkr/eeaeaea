-- Minimal GDrive MP4 Player (must use executor that supports getcustomasset, writefile, VideoFrame)

if not getcustomasset or not writefile or not game:HttpGet then
    return warn("Executor doesn't support required functions.")
end

local player = game:GetService("Players").LocalPlayer

-- GUI Setup
local gui = Instance.new("ScreenGui")
gui.Name = "VideoPlayer"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

local video = Instance.new("VideoFrame")
video.Name = "GDriveVideo"
video.Size = UDim2.new(1, 0, 1, 0)
video.Position = UDim2.new(0, 0, 0, 0)
video.BackgroundTransparency = 1
video.Looped = true
video.Volume = 5
video.Parent = gui

-- Google Drive direct download
local fileId = "1SJmcZDcYDwUHBalRPBuOufMRYdqvAiqp"
local downloadUrl = "https://drive.google.com/uc?export=download&id=" .. fileId
local fileName = "gdrive_video.mp4"

-- Download and play
writefile(fileName, game:HttpGet(downloadUrl))
video.Video = getcustomasset(fileName)
video.Playing = true
