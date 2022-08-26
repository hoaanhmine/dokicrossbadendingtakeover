function opponentNoteHit()
    health = getProperty('health')
	if not botplay then
    if getProperty('health') > 0 and dadName == 'sadsayo' then
        setProperty('health', health- 0.01);
	elseif getProperty('health') > 0 and dadName == 'sayopoem' then
		setProperty('health', health- 0.05);
    end
	end
end