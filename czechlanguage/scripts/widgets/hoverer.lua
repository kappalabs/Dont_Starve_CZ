local Text = require "widgets/text"
local Widget = require "widgets/widget"

local YOFFSETUP = 40
local YOFFSETDOWN = 30
local XOFFSET = 10

local HoverText = Class(Widget, function(self, owner)
    Widget._ctor(self, "HoverText")
	self.owner = owner
    self.isFE = false
    self:SetClickable(false)
    --self:MakeNonClickable()
    self.text = self:AddChild(Text(UIFONT, 30))
    self.text:SetPosition(0,YOFFSETUP,0)
    self.secondarytext = self:AddChild(Text(UIFONT, 30))
    self.secondarytext:SetPosition(0,-YOFFSETDOWN,0)
    self:FollowMouseConstrained()
    self:StartUpdating()
end)

function HoverText:OnUpdate()
	    
    local using_mouse = self.owner.components and self.owner.components.playercontroller:UsingMouse()        
	
	if using_mouse ~= self.shown then
		if using_mouse then
			self:Show()
		else
			self:Hide()
		end
	end
	
	if not self.shown then 
		return 
	end
	
    local str = nil
    if self.isFE == false then 
        str = self.owner.HUD.controls:GetTooltip() or self.owner.components.playercontroller:GetHoverTextOverride()
    else
        str = self.owner:GetTooltip()
    end

	--### MOD CzechTranslationFeature -->
	if str then
		if TheInput:IsKeyDown(STRINGS.CZT_SWAP_KEY) then
			name = CZTGetReplacement(name, 2)
		else
			name = CZTGetReplacement(name, 1)
		end
	end
	--### <EO> MOD CzechTranslationFeature <--

    local secondarystr = nil
 
    if not str and self.isFE == false then
        local lmb = self.owner.components.playercontroller:GetLeftMouseAction()
        if lmb then
            
            str = lmb:GetActionString()
            
            if lmb.target and lmb.invobject == nil and lmb.target ~= lmb.doer then
				local name = lmb.target:GetDisplayName() or (lmb.target.components.named and lb.target.components.named.name)
                
    			--### MOD CzechTranslationFeature -->
				if TheInput:IsKeyDown(STRINGS.CZT_SWAP_KEY) then
					name = CZTGetReplacement(name, 2)
				else
					name = CZTGetReplacement(name, 1)
				end
    			--### <EO> MOD CzechTranslationFeature <--
                
                if name then
					local adjective = lmb.target:GetAdjective()
					
					if adjective then
						str = str.. " " .. adjective .. " " .. name
					else
						str = str.. " " .. name
					end
					
					if lmb.target.components.stackable and lmb.target.components.stackable.stacksize > 1 then
	                    str = str .. " x" .. tostring(lmb.target.components.stackable.stacksize)
					end
                    if lmb.target.components.inspectable and lmb.target.components.inspectable.recordview and lmb.target.prefab then
                        ProfileStatsSet(lmb.target.prefab .. "_seen", true)
                    end
				end
            end
        end
        local rmb = self.owner.components.playercontroller:GetRightMouseAction()
        if rmb then
            secondarystr = STRINGS.RMB .. ": " .. rmb:GetActionString()
        end
    end

    if str then

        self.text:SetString(str)
        self.text:Show()
    else
        self.text:Hide()
    end
    if secondarystr then
        self.secondarytext:SetString(secondarystr)
        self.secondarytext:Show()
    else
        self.secondarytext:Hide()
    end

    local changed = (self.str ~= str) or (self.secondarystr ~= secondarystr)
    self.str = str
    self.secondarystr = secondarystr
    if changed then
        local pos = TheInput:GetScreenPosition()
        self:UpdatePosition(pos.x, pos.y)
    end
end

--### MOD CzechTranslationFeature -->
function CZTGetReplacement(text, part)
	if string.match(text, STRINGS.CZT_MARK) then
		local s_ind, e_ind = string.find(text, STRINGS.CZT_MARK)

		if part==1 then return string.sub(text, 1, s_ind-1)
		else return string.sub(text, s_ind+string.len(STRINGS.CZT_MARK))
		end
	end

	if part==1 then return text
	else return ""
	end
end
--### <EO> MOD CzechTranslationFeature <--

function HoverText:UpdatePosition(x,y)


	local scale = self:GetScale()

    --### MOD DisplayValues2 -->
    local positionshift = 0
    if self.text and self.str then
        if string.find(self.str, STRINGS.DFV_HUNGER) then
        	positionshift = positionshift + 15
        end
        if string.find(self.str, STRINGS.DFV_HEALTH) then
        	positionshift = positionshift + 15
        end
        if string.find(self.str, STRINGS.DFV_SANITY) then
        	positionshift = positionshift + 15
        end
        if string.find(self.str, STRINGS.DFV_SPOILSOON) or string.find(self.str, STRINGS.DFV_SPOILIN) then
        	positionshift = positionshift + 15
        end
	end 
    y = y + positionshift*scale.y
    --### <EO> MOD DisplayValues2 <--	

    local scr_w, scr_h = TheSim:GetScreenSize()

    local w = 0
    local h = 0

    if self.text and self.str then
        local w0, h0 = self.text:GetRegionSize()
        w = math.max(w, w0)
        h = math.max(h, h0)
    end
    if self.secondarytext and self.secondarystr then
        local w1, h1 = self.secondarytext:GetRegionSize()
        w = math.max(w, w1)
        h = math.max(h, h1)
    end

	w = w*scale.x
	h = h*scale.y
	
    x = math.max(x, w/2 + XOFFSET)
    x = math.min(x, scr_w - w/2 - XOFFSET)

    y = math.max(y, h/2 + YOFFSETDOWN*scale.y)
    y = math.min(y, scr_h - h/2 - YOFFSETUP*scale.x)

    self:SetPosition(x,y,0)
end

function HoverText:FollowMouseConstrained()
    if not self.followhandler then
        self.followhandler = TheInput:AddMoveHandler(function(x,y) self:UpdatePosition(x,y) end)
        local pos = TheInput:GetScreenPosition()
        self:UpdatePosition(pos.x, pos.y)
    end
end

return HoverText
