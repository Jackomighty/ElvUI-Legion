local E, L, V, P, G = unpack(select(2, ...)); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local S = E:GetModule('Skins')

--Cache global variables
--Lua functions
local _G = _G
--WoW API / Variables
--Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS: SquareButton_SetIcon

local function LoadSkin()
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.worldmap ~= true then return end

	local WorldMapFrame = _G["WorldMapFrame"]
	WorldMapFrame.BorderFrame.Inset:StripTextures()
	WorldMapFrame.BorderFrame:StripTextures()
	WorldMapFrameNavBar:StripTextures()
	WorldMapFrameNavBarOverlay:StripTextures()

	WorldMapFrameNavBarHomeButton:StripTextures()
	WorldMapFrameNavBarHomeButton:CreateBackdrop("Default", true)
	WorldMapFrameNavBarHomeButton.backdrop:SetPoint("TOPLEFT", WorldMapFrameNavBarHomeButton, "TOPLEFT", 0, 0)
	WorldMapFrameNavBarHomeButton.backdrop:SetPoint("BOTTOMRIGHT", WorldMapFrameNavBarHomeButton, "BOTTOMRIGHT", -15, 0)
	WorldMapFrameNavBarHomeButton:SetFrameLevel(1)
	WorldMapFrameNavBarHomeButton.text:FontTemplate()

	S:HandleDropDownBox(WorldMapLevelDropDown)
	WorldMapLevelDropDown:Point("TOPLEFT", -17, 0)

	WorldMapFrame.BorderFrame:CreateBackdrop("Transparent")
	WorldMapFrame.BorderFrame.Inset:CreateBackdrop("Default")
	WorldMapFrame.BorderFrame.Inset.backdrop:Point("TOPLEFT", WorldMapFrame.BorderFrame.Inset, "TOPLEFT", 1, -3)
	WorldMapFrame.BorderFrame.Inset.backdrop:Point("BOTTOMRIGHT", WorldMapFrame.BorderFrame.Inset, "BOTTOMRIGHT", -1, 1)

	S:HandleScrollBar(QuestScrollFrameScrollBar)

	if E.global.general.disableTutorialButtons then
		WorldMapFrameTutorialButton:Kill()
	end

	local QuestMapFrame = _G["QuestMapFrame"]
	S:HandleButton(QuestMapFrame.DetailsFrame.BackButton)
	S:HandleButton(QuestMapFrame.DetailsFrame.AbandonButton)
	S:HandleButton(QuestMapFrame.DetailsFrame.ShareButton, true)
	S:HandleButton(QuestMapFrame.DetailsFrame.TrackButton)
	S:HandleButton(QuestMapFrame.DetailsFrame.CompleteQuestFrame.CompleteButton, true)

	if E.private.skins.blizzard.tooltip then
		QuestMapFrame.QuestsFrame.StoryTooltip:SetTemplate("Transparent")
	end

	QuestMapFrame.DetailsFrame.CompleteQuestFrame:StripTextures()

	S:HandleCloseButton(WorldMapFrameCloseButton)

	S:HandleMaxMinFrame(WorldMapFrame.BorderFrame.MaximizeMinimizeFrame)

	local TrackingOptions = _G["WorldMapFrame"].UIElementsFrame.TrackingOptionsButton
	TrackingOptions.Button:StripTextures()
	TrackingOptions.Background:SetAlpha(0)
	TrackingOptions.IconOverlay:SetAlpha(0)

	S:HandleNextPrevButton(WorldMapFrame.UIElementsFrame.OpenQuestPanelButton)
	S:HandleNextPrevButton(WorldMapFrame.UIElementsFrame.CloseQuestPanelButton)
	SquareButton_SetIcon(WorldMapFrame.UIElementsFrame.CloseQuestPanelButton, 'LEFT')

	WorldMapFrame.UIElementsFrame.BountyBoard.BountyName:FontTemplate(nil, 14, "OUTLINE")
	WorldMapFrame.UIElementsFrame.OpenQuestPanelButton:Size(22,20)
	WorldMapFrame.UIElementsFrame.CloseQuestPanelButton:Size(22,20)

	S:HandleCloseButton(WorldMapFrame.UIElementsFrame.BountyBoard.TutorialBox.CloseButton)

	WorldMapFrameAreaLabel:FontTemplate(nil,30)
	WorldMapFrameAreaLabel:SetShadowOffset(2,-2)
	WorldMapFrameAreaLabel:SetTextColor(0.9,0.8,0.6)
	WorldMapFrameAreaDescription:FontTemplate(nil,20)
	WorldMapFrameAreaDescription:SetShadowOffset(2,-2)
	WorldMapFrameAreaPetLevels:FontTemplate(nil,20)
	WorldMapFrameAreaPetLevels:SetShadowOffset(2,-2)
	WorldMapZoneInfo:FontTemplate(nil,25)
	WorldMapZoneInfo:SetShadowOffset(2,-2)
end

S:AddCallback("SkinWorldMap", LoadSkin)