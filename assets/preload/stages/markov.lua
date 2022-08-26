local crazy = false
local run = false
local dead = false

function onCreate()
	makeLuaSprite('p2','ben-p2',-400,-220)
	 scaleObject('p2',1.3,1.3)
		 setProperty('p2.alpha',0)
			 setScrollFactor('p2',1,1)
	makeLuaSprite('dbg','inky depths',-450,-170)
		 setProperty('dbg.alpha',0)
			 setScrollFactor('dbg',0.6,0.6)
	makeLuaSprite('dfg','nightmareBendy_foreground',-500,50)
		 setProperty('dfg.alpha',0)
			 setScrollFactor('dfg',1,1)
	if not lowQuality then
	 makeAnimatedLuaSprite('sam','SammyBg',1400,350)
		 addAnimationByPrefix('sam','Sam instance','Sam instance', 24,true)
			 scaleObject('sam',0.6,0.6)
				 setProperty('sam.flipX',true)
					 setProperty('sam.alpha',0)
	 makeAnimatedLuaSprite('Fyre','Fyre',-150,150)
		 addAnimationByPrefix('Fyre','Fyre','Penis instance',24,true) --all question about animation name to BrightFyre!
			 setProperty('Fyre.alpha',0)
	end
	makeAnimatedLuaSprite('BendyStage2_Back','BendyStage2_Back', -1000, -300)
     scaleObject('BendyStage2_Back', 2, 2);
		 addAnimationByPrefix('BendyStage2_Back','Pain ','Pain ', 48, true)
			 setProperty('BendyStage2_Back.alpha',0)
				 
	 addLuaSprite('p2',false)
	 addLuaSprite('sam',false)
	 addLuaSprite('BendyStage2_Back',false)
	 addLuaSprite('dbg',false)
	 addLuaSprite('Fyre',false)
	 addLuaSprite('dfg',false)
	 
	 addCharacterToList('ben','bf')
	 addCharacterToList('ben-run','bf')
	 addCharacterToList('bendead','bf')
	 addCharacterToList('yuri-fly','dad')
end

function onStepHit()
	if curStep == 448 or curStep == 1504 then
	 scaleObject('dad',0.85,0.85)
	 scaleObject('bf',0.85,0.85)
	 setProperty('p2.alpha',1)
	 setProperty('sam.alpha',1)
	elseif curStep == 989 then
	 scaleObject('dad',1,1)
	 scaleObject('bf',1,1)
	 setProperty('p2.alpha',0)
	 setProperty('sam.alpha',0)
	elseif curStep == 2267 or curStep == 2735 or curStep == 2767 then
	 removeLuaSprite('p2')
	 removeLuaSprite('sam')
	 setProperty('BendyStage2_Back.alpha',1)
	 setProperty('dad.x', -700)
	 setProperty('dad.y', -150)
	 setProperty('bf.x',900)
	 setProperty('bf.y',300)
	 setProperty('bf.flipX',true)
	 scaleObject('dad',0.6,0.6)
	 triggerEvent('Camera Follow Pos', '150', '300')
	 doTweenZoom('asf', 'camGame', 0.7, 0.01, 'cubeOut')
     setProperty('defaultCamZoom', 0.6)
	 setProperty('dbg.alpha',0)
	 setProperty('dfg.alpha',0)
	 setProperty('Fyre.alpha',0)
	elseif curStep == 2719 or curStep == 2751 or curBeat == 2792 then
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
	elseif curStep == 2816 then
	 setProperty('dbg.alpha',0)
	 setProperty('dfg.alpha',0)
	 setProperty('Fyre.alpha',0)
	 scaleObject('bf',1,1)
	 scaleObject('dad',1,1)
	 setProperty('bf.y',100)
	 setProperty('bf.x',900)
	 setProperty('BendyStage2_Back.alpha',0)
	 setProperty('p2.alpha',0)
	 setProperty('sam.alpha',0)
	end
	if curStep == 2268 then
	 removeLuaSprite('p2')
	 removeLuaSprite('sam')
	end
end