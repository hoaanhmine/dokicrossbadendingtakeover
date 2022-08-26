function onUpdate(elapsed)
	if dadName == 'yuri-fly' then  
		if curStep == 2267 then
        	 started = true
		end
	 songPos = getSongPosition()	
	 local currentBeat = (songPos/5000)*(curBpm/60)
	 doTweenY('opponentmove', 'dad', -150 - 50*math.sin((currentBeat+12*12)*math.pi), 2)
	 doTweenX('disruptor2', 'disruptor2.scale', 0 - 50*math.sin((currentBeat+1*0.1)*math.pi), 6)
	 doTweenY('disruptor2', 'disruptor2.scale', 0 - 31*math.sin((currentBeat+1*1)*math.pi), 6)
	 end
end