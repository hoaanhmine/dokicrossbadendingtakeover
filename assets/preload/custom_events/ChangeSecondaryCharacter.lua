function onEvent(name, character1name, character2name)
	if name == "ChangeSecondaryCharacter" then
		setPropertyLuaSprite(character1name, 'alpha', 0)
		setPropertyLuaSprite(character2name, 'alpha', 0.5)
	end
end