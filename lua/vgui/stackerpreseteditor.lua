local PANEL = {}

local vgui = vgui
local pairs = pairs
local AccessorFunc = AccessorFunc

AccessorFunc( PANEL, "m_ConCommands", "ConCommands" )

function PANEL:Add()
	if ( not self.m_ConVars ) then return end

	local ToName = self.txtName:GetValue()
	if ( not ToName or ToName == "" ) then return end

	-- Todo, Handle name collision
	local tabValues = {}

	for _, v in pairs( self.m_ConVars ) do
		local cvar = GetConVar( v.CVar )
		tabValues[v.CCmd] = cvar:GetString()
	end

	presets.Add( self.m_strType, ToName, tabValues )
	self:Update()
	self.PresetList:SelectByName( ToName )
	self.txtName:SetText( "" )

	if ( self.m_PresetControl ) then
		self.m_PresetControl:Update()
	end
end

vgui.Register( "StackerPresetEditor", PANEL, "PresetEditor" )
