function onCreate()
	makeLuaSprite('ok','cup-ok',-500,-220)
	 scaleObject('ok',1.3,1.3)
		 setScrollFactor('ok',1,1)
			 addLuaSprite('ok',false)
	makeLuaSprite('pissed','cup-pissed',-500,-220)
	 scaleObject('pissed',1.3,1.3)
		 setScrollFactor('pissed',1,1)
			 setProperty('pissed.alpha',0)
				 addLuaSprite('pissed',false)
	makeLuaSprite('dead','cup-dead',-500,-220)
	 scaleObject('dead',1.3,1.3)
		 setScrollFactor('dead',1,1)
			 setProperty('dead.alpha',0)
				 addLuaSprite('dead',false)
	makeLuaSprite('mug','mug',-500,500)
	 setScrollFactor('mug',1,1)
		 setProperty('mug.alpha',0)
			 addLuaSprite('mug',false)
	 addCharacterToList('cup','bf')
	 addCharacterToList('cup-pissed','bf')
	 addCharacterToList('cup-dead','bf')
end

function onStepHit()
	if curStep == 288 then --oh what happend?! why everything so sad
	 setProperty('ok.alpha',0)
		 setProperty('pissed.alpha',1)
	 setProperty('mug.alpha',1)
	elseif curStep == 544 then --nevermind
	 setProperty('pissed.alpha',0)
		 setProperty('ok.alpha',1)
	 setProperty('mug.alpha',0)
	elseif curStep == 800 then --noo! again! I'm sad now :(
	 setProperty('ok.alpha',0)
		 setProperty('pissed.alpha',1)
	 setProperty('mug.alpha',1)
	elseif curStep == 1312 then --Happy :D 
	 setProperty('dead.alpha',1)
		 setProperty('pissed.alpha',0)
	 setProperty('mug.alpha',0)
	elseif curStep == 1824 then --Sad but fast :0
	 setProperty('pissed.alpha',1)
		 setProperty('dead.alpha',0)
	 setProperty('mug.alpha',1)
	elseif curStep > 2336 then --Oh Happy again! :D
	 setProperty('dead.alpha',1)
		 setProperty('pissed.alpha',0)
	 setProperty('mug.alpha',0)
	end
end
--end