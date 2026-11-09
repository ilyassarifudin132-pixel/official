
--========================================
-- YASZ EXCLUSIVE | STEAL A EGG
-- LOCAL GUI DEMO
--========================================

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local LP = Players.LocalPlayer

local OWNER = "sayangku_gacor"
local ADMIN = "kiyaaaaw_25"

local old = CoreGui:FindFirstChild("YASZ_EXCLUSIVE")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "YASZ_EXCLUSIVE"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

local function create(class,parent,props)
    local obj = Instance.new(class)
    for k,v in pairs(props) do obj[k] = v end
    obj.Parent = parent
    return obj
end

local main = create("Frame",gui,{
    Size=UDim2.fromOffset(470,340),
    Position=UDim2.new(.5,-235,.5,-170),
    BackgroundColor3=Color3.fromRGB(13,13,19),
    BorderSizePixel=0,
    Active=true
})

create("UICorner",main,{CornerRadius=UDim.new(0,12)})

local stroke=create("UIStroke",main,{
    Color=Color3.fromRGB(125,65,220),
    Thickness=1.5
})

local top=create("Frame",main,{
    Size=UDim2.new(1,0,0,43),
    BackgroundColor3=Color3.fromRGB(35,20,55),
    BorderSizePixel=0
})

create("UICorner",top,{CornerRadius=UDim.new(0,12)})

create("TextLabel",top,{
    Size=UDim2.new(1,-90,1,0),
    Position=UDim2.fromOffset(12,0),
    BackgroundTransparency=1,
    Text="YASZ EXCLUSIVE",
    TextColor3=Color3.new(1,1,1),
    Font=Enum.Font.GothamBold,
    TextSize=17,
    TextXAlignment=Enum.TextXAlignment.Left
})

local close=create("TextButton",top,{
    Size=UDim2.fromOffset(32,28),
    Position=UDim2.new(1,-38,0,7),
    Text="X",
    BackgroundColor3=Color3.fromRGB(180,40,55),
    TextColor3=Color3.new(1,1,1),
    Font=Enum.Font.GothamBold,
    TextSize=14
})

local minimize=create("TextButton",top,{
    Size=UDim2.fromOffset(32,28),
    Position=UDim2.new(1,-75,0,7),
    Text="-",
    BackgroundColor3=Color3.fromRGB(70,60,90),
    TextColor3=Color3.new(1,1,1),
    Font=Enum.Font.GothamBold,
    TextSize=18
})

-- DRAG
local dragging=false
local dragStart
local startPos

top.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1
    or input.UserInputType==Enum.UserInputType.Touch then
        dragging=true
        dragStart=input.Position
        startPos=main.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType==Enum.UserInputType.MouseMovement
        or input.UserInputType==Enum.UserInputType.Touch
    ) then
        local delta=input.Position-dragStart
        main.Position=UDim2.new(
            startPos.X.Scale,startPos.X.Offset+delta.X,
            startPos.Y.Scale,startPos.Y.Offset+delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1
    or input.UserInputType==Enum.UserInputType.Touch then
        dragging=false
    end
end)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local minimized=false
minimize.MouseButton1Click:Connect(function()
    minimized=not minimized
    main.Size=minimized and UDim2.fromOffset(470,43)
        or UDim2.fromOffset(470,340)
end)

-- SIDEBAR
local sidebar=create("Frame",main,{
    Position=UDim2.fromOffset(8,52),
    Size=UDim2.fromOffset(112,280),
    BackgroundTransparency=1
})

local content=create("Frame",main,{
    Position=UDim2.fromOffset(128,52),
    Size=UDim2.new(1,-138,1,-62),
    BackgroundColor3=Color3.fromRGB(23,23,32),
    BorderSizePixel=0
})

create("UICorner",content,{CornerRadius=UDim.new(0,9)})

local pages={
    "EVENTS","FARM","WINDOWS","SERVER",
    "VISUAL","MONITOR","SEARCH","SOUL MODE",
    "SAVE ZONE","GLOBAL CHAT"
}

local function clear()
    for _,v in ipairs(content:GetChildren()) do
        if v:IsA("GuiObject") then v:Destroy() end
    end
end

local function label(parent,text,y,size)
    return create("TextLabel",parent,{
        Position=UDim2.fromOffset(10,y),
        Size=UDim2.new(1,-20,0,size or 30),
        BackgroundTransparency=1,
        Text=text,
        TextColor3=Color3.new(1,1,1),
        TextSize=14,
        Font=Enum.Font.Gotham,
        TextXAlignment=Enum.TextXAlignment.Left,
        TextWrapped=true
    })
end

local function button(parent,text,y,callback)
    local b=create("TextButton",parent,{
        Position=UDim2.fromOffset(10,y),
        Size=UDim2.new(1,-20,0,32),
        BackgroundColor3=Color3.fromRGB(55,38,78),
        Text=text,
        TextColor3=Color3.new(1,1,1),
        Font=Enum.Font.GothamBold,
        TextSize=12
    })
    create("UICorner",b,{CornerRadius=UDim.new(0,6)})
    b.MouseButton1Click:Connect(callback)
    return b
end

local function openPage(name)
    clear()

    if name=="GLOBAL CHAT" then
        label(content,"YASZ GLOBAL CHAT (LOCAL)",5,25)

        local chat=create("ScrollingFrame",content,{
            Position=UDim2.fromOffset(8,35),
            Size=UDim2.new(1,-16,1,-85),
            BackgroundColor3=Color3.fromRGB(14,14,20),
            BorderSizePixel=0,
            CanvasSize=UDim2.new(),
            AutomaticCanvasSize=Enum.AutomaticSize.Y
        })

        create("UIListLayout",chat,{
            Padding=UDim.new(0,5),
            SortOrder=Enum.SortOrder.LayoutOrder
        })

        local input=create("TextBox",content,{
            Position=UDim2.new(0,8,1,-40),
            Size=UDim2.new(1,-90,0,32),
            BackgroundColor3=Color3.fromRGB(40,40,50),
            Text="",
            PlaceholderText="Tulis pesan...",
            TextColor3=Color3.new(1,1,1),
            Font=Enum.Font.Gotham,
            TextSize=12
        })

        local send=button(content,"SEND",content.AbsoluteSize.Y-45,function()
            local msg=input.Text
            if msg=="" then return end

            local role="PLAYER"
            local verified=false
            local duration=nil

            if LP.Name==OWNER then
                role="OWNER"
                verified=true
                duration=15
            elseif LP.Name==ADMIN then
                role="ADMIN"
                verified=true
                duration=15
            end

            local line=create("TextLabel",chat,{
                Size=UDim2.new(1,-8,0,55),
                BackgroundColor3=Color3.fromRGB(35,30,45),
                Text="",
                TextColor3=Color3.new(1,1,1),
                Font=Enum.Font.Gotham,
                TextSize=12,
                TextWrapped=true
            })

            local check=verified and "  ☑" or ""
            line.Text=LP.Name..check.." ["..role.."]\n"..msg

            if duration then
                task.delay(duration,function()
                    if line.Parent then line:Destroy() end
                end)
            end

            input.Text=""
        end)

        send.Size=UDim2.fromOffset(65,32)
        send.Position=UDim2.new(1,-73,1,-40)

    elseif name=="SOUL MODE" then
        label(content,"SOUL MODE",10,30)
        label(content,"Simulasi visual lokal.\nTidak mengubah posisi karakter asli.",45,55)
        button(content,"AKTIFKAN SIMULASI",110,function()
            label(content,"Soul Mode: SIMULASI AKTIF",155,30)
        end)
        button(content,"NONAKTIFKAN",195,function()
            label(content,"Soul Mode: NONAKTIF",230,30)
        end)

    elseif name=="SAVE ZONE" then
        label(content,"SAVE ZONE STATUS",10,30)
        label(content,"Posisi karakter: "..tostring(
            LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            and LP.Character.HumanoidRootPart.Position or "Tidak tersedia"
        ),50,65)
        label(content,"Indikator lokal saja. Tidak mengunci karakter.",120,50)

    elseif name=="SEARCH" then
        label(content,"SEARCH EGG",10,30)
        local search=create("TextBox",content,{
            Position=UDim2.fromOffset(10,48),
            Size=UDim2.new(1,-20,0,35),
            BackgroundColor3=Color3.fromRGB(45,40,55),
            Text="",
            PlaceholderText="Cari nama Egg...",
            TextColor3=Color3.new(1,1,1),
            Font=Enum.Font.Gotham,
            TextSize=13
        })
        label(content,"Pencarian lokal berdasarkan teks.",95,40)

    elseif name=="WINDOWS" then
        label(content,"EGG WINDOWS",10,30)
        label(content,"Daftar Egg harus dihubungkan ke data game yang sah.",50,65)

    elseif name=="FARM" then
        label(content,"FARM PANEL",10,30)
        label(content,"Informasi farming lokal.",50,35)

    elseif name=="EVENTS" then
        label(content,"EVENTS",10,30)
        label(content,"Panel informasi event game.",50,35)

    elseif name=="SERVER" then
        label(content,"SERVER INFORMATION",10,30)
        label(content,"Players: "..#Players:GetPlayers(),50,30)
        label(content,"Place ID: "..game.PlaceId,85,30)

    elseif name=="VISUAL" then
        label(content,"VISUAL SETTINGS",10,30)
        label(content,"Pengaturan visual GUI.",50,40)

    elseif name=="MONITOR" then
        label(content,"PLAYER MONITOR",10,30)
        label(content,"Username: "..LP.Name,50,30)
        label(content,"DisplayName: "..LP.DisplayName,85,30)
        label(content,"Account age: "..LP.AccountAge.." days",120,30)
    end
end

for i,name in ipairs(pages) do
    local b=create("TextButton",sidebar,{
        Position=UDim2.fromOffset(0,(i-1)*31),
        Size=UDim2.fromOffset(112,27),
        BackgroundColor3=Color3.fromRGB(35,30,47),
        Text=name,
        TextColor3=Color3.new(1,1,1),
        Font=Enum.Font.GothamBold,
        TextSize=10
    })
    create("UICorner",b,{CornerRadius=UDim.new(0,5)})
    b.MouseButton1Click:Connect(function()
        openPage(name)
    end)
end

openPage("EVENTS")

print("YASZ EXCLUSIVE LOADED")
