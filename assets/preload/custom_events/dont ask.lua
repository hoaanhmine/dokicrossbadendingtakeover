function onEvent(never,gonna,giveYouUp)
	if never == 'dont ask' and gonna == 'never gonna' and giveYouUp == 'give you up' then
	playSound('never',5)
	elseif never == 'dont ask' and gonna == '!' then
		setProperty('BendyStage2_Back.alpha',0)
		 setProperty('dad.x', -150)
		 setProperty('dad.y', 100)
		 setProperty('bf.x',900)
		 setProperty('bf.y',-150)
		 setProperty('bf.flipX',false)
		 scaleObject('dad',1,1)
		 triggerEvent('Camera Follow Pos', '', '')
		 setProperty('dbg.alpha',1)
		 setProperty('dfg.alpha',1)
		 setProperty('Fyre.alpha',1)
		 scaleObject('bf',0.6,0.6)
		 scaleObject('dad',0.6,0.6)
		 setProperty('bf.y',200)
		 setProperty('bf.x',1000)
	 doTweenZoom('asf', 'camGame', 0.9, 0.01, 'linear')
     setProperty('defaultCamZoom', 0.9)
	end
end