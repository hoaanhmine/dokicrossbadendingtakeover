local sad = false
local dead = false

function onCreate()
	makeAnimatedLuaSprite('Cuphead Hadoken','Cuphead Hadoken', 350, 400)
	setProperty('Cuphead Hadoken.flipX',true)
	addAnimationByPrefix('Cuphead Hadoken','Hadolen instance ','Hadolen instance ',24, false)
	scaleObject('Cuphead Hadoken', 0.65, 0.65);	

	makeAnimatedLuaSprite('Cuphead Hadoken Final','Cuphead Hadoken Final', 400, 400)
	setProperty('Cuphead Hadoken Final.flipX',true)
	addAnimationByPrefix('Cuphead Hadoken Final','DeathBlast instance ','DeathBlast instance ',24, false)
	scaleObject('Cuphead Hadoken Final', 0.65, 0.65);	

	makeAnimatedLuaSprite('Cuphead Burst','Cuphead Hadoken', -400, -100)
		setProperty('Cuphead Burst.flipX',true)
	addAnimationByPrefix('Cuphead Burst','BurstFX instance ','BurstFX instance ',24, false)
end

function onEvent(n,b,c)
	if n == 'aaa' then
		if b == '1' then
			if not lowQuality then
				playSound('pbs', 3);
			end
		end

		if sad == true or dead == true then
			characterPlayAnim('boyfriend','attack',true)
		end
		if dead == false and b == '1' then
		 runTimer('CupheadBigShot_StartShoot', 0.4)
		 runTimer('CupheadBigShot_ShotConnect', 0.65)
		 runTimer('CupheadBigShot_RemoveShot', 1)
		elseif dead == true and b == '1' then
		 runTimer('A',0.01)
		elseif dead == false and b == '' then
		 runTimer('CupheadBigShot_StartShoot', 0.4)
		 runTimer('CupheadBigShot_ShotConnectns', 0.65)
		 runTimer('CupheadBigShot_RemoveShot', 1)
		elseif dead == true and b == '' then
		 runTimer('Ans',0.01)
		end
	end
end


function onTimerCompleted(tag)
	if (tag == 'CupheadBigShot_StartShoot') then
		triggerEvent('Add Camera Zoom', '0.1', '0.05');
		if not lowQuality then
			addLuaSprite('Cuphead Hadoken', true)
			objectPlayAnimation('Cuphead Hadoken','Hadolen instance ', true)
			setProperty('Cuphead Hadoken.alpha',1)
		end
	end
	if tag == 'CupheadBigShot_ShotConnect' then
		health = getProperty('health')
			playSound('bs', 3);
		if not lowQuality then
			addLuaSprite('Cuphead Burst', true)
			objectPlayAnimation('Cuphead Burst','BurstFX instance ', true)
			doTweenColor('iconP2','iconP2','ff0000',0.01,'linear')
			doTweenColor('healthBar', 'healthBar', 'ff0000', 0.01, 'linear')
		end
		setProperty('Cuphead Hadoken.alpha',0)
		setProperty('health', health + 0.5)
		triggerEvent('Add Camera Zoom', '0.3', '0.1');
	end
	if tag == 'CupheadBigShot_ShotConnectns' then
		health = getProperty('health')
		if not lowQuality then
			addLuaSprite('Cuphead Burst', true)
			objectPlayAnimation('Cuphead Burst','BurstFX instance ', true)
		end
		setProperty('Cuphead Hadoken.alpha',0)
		setProperty('health', health + 0.3)
		triggerEvent('Add Camera Zoom', '0.3', '0.1');
	end
	if tag == 'CupheadBigShot_RemoveShot' then
		removeLuaSprite('Cuphead Hadoken', false)
		removeLuaSprite('Cuphead Hadoken Final', false)
	end
	if tag == 'A' then
		health = getProperty('health')
		playSound('bs', 3);
		setProperty('health', health + 1)
		triggerEvent('Screen Shake', '0.2, 0.05', '0.2, 0.025');
		triggerEvent('Add Camera Zoom', '0.3', '0.1');
		doTweenColor('iconP2','iconP2','fe04ea',0.01,'linear')
		doTweenColor('healthBar', 'healthBar', 'fe04ea', 0.01, 'linear')
	end
	if tag == 'Ans' then
		health = getProperty('health')
		setProperty('health', health + 1)
		triggerEvent('Screen Shake', '0.2, 0.05', '0.2, 0.025');
		triggerEvent('Add Camera Zoom', '0.3', '0.1');
	end
end

function onStepHit()
	if curStep == 288 or curStep == 800 or curStep == 1824 then
	 sad = true
	 dead = false
	elseif curStep == 544 then
	 sad = false
	 dead = false
	elseif curStep == 1312 or curStep == 2336 then
	 sad = false
	 dead = true
	end
	if curStep < 32 then
	 setProperty('health', 1)
	end
end

function onTweenCompleted(t)
	if t == 'iconP2' then
	 doTweenColor('DiconP2','iconP2','FFFFFF',1,'linear')
	 doTweenColor('healthBar', 'healthBar', 'FFFFFF', 1, 'linear')
	end
end

--16ecff
--ff0000
--fe04ea