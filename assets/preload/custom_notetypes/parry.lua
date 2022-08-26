local poem = false

function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'parry' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'parryNotes');
		end
	end
end
function  goodNoteHit(id, noteData, noteType, isSustainNote)
	if (noteType == 'parry') and (isSustainNote == false) then
	 playSound('parry', 1)
		if poem == true then
		 doTweenColor('ptimebar', 'timeBar', 'ff00ae', 0.01, 'linear')
		else
		 doTweenColor('timebar', 'timeBar', 'ff00ae', 0.01, 'linear')
		end
	end
end

function onStepHit()
	if curStep == 0 or curStep == 1824 then
	 poem = false
	elseif curStep == 1312 or curStep == 2336 then
	 poem = true
	end
end

function onUpdate()
	if poem == false then
		setProperty('timeBar.color', getColorFromHex('FFFFFF'))
	else
		setProperty('timeBar.color', getColorFromHex('ff0000'))
	end
end

function onTweenCompleted(t)
	if t == 'timebar' then
	 doTweenColor('timebar2', 'timeBar', 'FFFFFF', 1, 'linear')
	end
	if t == 'ptimebar' then
	 doTweenColor('timebarp2', 'timeBar', 'ff0000', 1, 'linear')
	end
end