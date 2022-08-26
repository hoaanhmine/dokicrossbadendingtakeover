local cardfully = 0;
local cardnotfully = 0;
local canstilladdmore = true
local sad = false
local firstattack = true

function onCreate()
 setPropertyFromClass('GameOverSubstate', 'characterName', 'no'); --Character json file for the death animation
 setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'cupdeath'); --put in mods/sounds/
 setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'cupdeath'); --put in mods/music/
 if not downscroll and not middlescroll then
	makeLuaText('atkTutor1','Sayori draining can kill you!',600,660,-150)
	setTextSize('atkTutor1',30)
	makeLuaText('atkTutor2','Press parry note to charge card',700,610,-125)
	setTextSize('atkTutor2',30)
	makeLuaText('atkTutor3','Space to attack',500,710,-100)
	setTextSize('atkTutor3',30)
	addLuaText('atkTutor1')
	addLuaText('atkTutor2')
	addLuaText('atkTutor3')
	makeLuaText('ATTACK!','ATTACK!',600,660,150)
	setTextSize('ATTACK!',40)
	setTextColor('ATTACK!','FF0000')
	setProperty('ATTACK!.alpha',0)
	addLuaText('ATTACK!')
	
 elseif not downscroll and middlescroll then
 	makeLuaText('atkTutor1','Sayori draining can kill you!',600,340,-150)
	setTextSize('atkTutor1',30)
	makeLuaText('atkTutor2','Press parry note to charge card',700,290,-125)
	setTextSize('atkTutor2',30)
	makeLuaText('atkTutor3','Space to attack',500,390,-100)
	setTextSize('atkTutor3',30)
	addLuaText('atkTutor1')
	addLuaText('atkTutor2')
	addLuaText('atkTutor3')
	makeLuaText('ATTACK!','ATTACK!',500,390,150)
	setTextSize('ATTACK!',40)
	setTextColor('ATTACK!','FF0000')
	setProperty('ATTACK!.alpha',0)
	addLuaText('ATTACK!')
 elseif downscroll and not middlescroll then
 	makeLuaText('atkTutor1','Sayori draining can kill you!',600,660,800)
	setTextSize('atkTutor1',30)
	makeLuaText('atkTutor2','Press parry note to charge card',700,610,825)
	setTextSize('atkTutor2',30)
	makeLuaText('atkTutor3','Space to attack',500,710,850)
	setTextSize('atkTutor3',30)
	addLuaText('atkTutor1')
	addLuaText('atkTutor2')
	addLuaText('atkTutor3')
	makeLuaText('ATTACK!','ATTACK!',500,660,500)
	setTextSize('ATTACK!',40)
	setTextColor('ATTACK!','FF0000')
	setProperty('ATTACK!.alpha',0)
	addLuaText('ATTACK!')
 elseif downscroll and middlescroll then
 	makeLuaText('atkTutor1','Sayori draining can kill you!',600,340,800)
	setTextSize('atkTutor1',30)
	makeLuaText('atkTutor2','Press parry note to charge card',700,290,825)
	setTextSize('atkTutor2',30)
	makeLuaText('atkTutor3','Space to attack',500,390,800)
	setTextSize('atkTutor3',30)
	addLuaText('atkTutor1')
	addLuaText('atkTutor2')
	addLuaText('atkTutor3')
	makeLuaText('ATTACK!','ATTACK!',500,390,500)
	setTextSize('ATTACK!',40)
	setTextColor('ATTACK!','FF0000')
	setProperty('ATTACK!.alpha',0)
	addLuaText('ATTACK!')
 end
     if downscroll then
        makeLuaSprite('card', 'cardfull',  1100 - 100, 100);
        setObjectCamera('card', 'hud')
        addLuaSprite('card', true)
        setProperty('card.scale.y', 0)
        setProperty('card.alpha', 1)
        setProperty('cardnotflipped.offset.x', -5)
        setProperty('cardnotflipped.offset.y', -30)
    else
        makeLuaSprite('card', 'cardfull',  1100 - 100, 600);
        setObjectCamera('card', 'hud')
        addLuaSprite('card', true)
        setProperty('card.scale.y', 0)
        setProperty('card.alpha', 1)
        setProperty('cardnotflipped.offset.x', -5)
        setProperty('cardnotflipped.offset.y', -30)
    end


    if downscroll then
        makeAnimatedLuaSprite('cardnotflipped', 'Cardcrap',  1100 - 100, 0);
        addAnimationByPrefix('cardnotflipped', 'popoutnormal', 'Card Normal Pop out instance 1', 24, false);
        addAnimationByPrefix('cardnotflipped', 'popoutparry', 'PARRY Card Pop out  instance 1', 24, false);
        addAnimationByPrefix('cardnotflipped', 'byehaveagreattime', 'Card Used instance 1', 24, false);
        addLuaSprite('cardnotflipped', true)
        setObjectCamera('cardnotflipped', 'hud')
        setProperty('cardnotflipped.alpha', 0)
    else
        makeAnimatedLuaSprite('cardnotflipped', 'Cardcrap',  1100 - 100, 500);
        addAnimationByPrefix('cardnotflipped', 'popoutnormal', 'Card Normal Pop out instance 1', 24, false);
        addAnimationByPrefix('cardnotflipped', 'popoutparry', 'PARRY Card Pop out  instance 1', 24, false);
        addAnimationByPrefix('cardnotflipped', 'byehaveagreattime', 'Card Used instance 1', 24, false);
        addLuaSprite('cardnotflipped', true)
        setObjectCamera('cardnotflipped', 'hud')
        setProperty('cardnotflipped.alpha', 0)
    end

end

function plusshit()
	cardthingy = cardthingy + 0.5
end

function carddoesthething()
	setProperty('card.alpha', 0)
    setProperty('cardnotflipped.alpha', 1)
	objectPlayAnimation('cardnotflipped', 'popoutnormal')
	setProperty('cardnotflipped.offset.y', -10)
    canattack = true;
	canstilladdmore = false
	setProperty('card.scale.y', 0.01)
	if downscroll then
	 setProperty('card.y',100)
	else
	 setProperty('card.y',600)
	end
end

function carddoesthethingparry()
	setProperty('card.alpha', 0)
    setProperty('cardnotflipped.alpha', 1)
	objectPlayAnimation('cardnotflipped', 'popoutparry')
	setProperty('cardnotflipped.offset.y', -10)
    canattack = true;
	canstilladdmore = false
	setProperty('card.scale.y', 0.01)
	if downscroll then
	 setProperty('card.y',100)
	else
	 setProperty('card.y',600)
	end
end

function cardgoback()
	setProperty('cardnotflipped.alpha', 0)
	canstilladdmore = true
end

function goodNoteHit(id, d, noteType, isSustainNote)
	if canstilladdmore then
        if not isSustainNote then
        setProperty('card.scale.y', getProperty('card.scale.y') + 0.01)
        setProperty('card.y', getProperty('card.y') - 0.5)
        setProperty('card.alpha', 1)
        --debugPrint(getProperty('card.scale.y'))
        end
        end

        
        if noteType == 'parry' then
            if canstilladdmore then
                carddoesthethingparry();
            end
        end
    
end

function onUpdatePost()
    if getProperty('cardnotflipped.animation.curAnim.name') == 'byehaveagreattime' then
        if getProperty('cardnotflipped.animation.curAnim.finished') then
            cardgoback()
        end
    end

    if getProperty('card.scale.y') > 0.9 then
        if canstilladdmore then
            carddoesthething()
        end
     end


    if canattack == true and keyJustPressed('space') then
		if sad == true then
        objectPlayAnimation('cardnotflipped', 'byehaveagreattime') 
		setProperty('cardnotflipped.offset.x', -5)
		setProperty('cardnotflipped.offset.y', -30)
		triggerEvent('aaa','1','')
		canattack = false
		end
    end
end

function onStepHit()
	if curStep == 288 or curStep == 800 then
	 sad = true
	elseif curStep == 544 then
	 sad = false
	end
	if curStep > 2592 then
	 carddoesthethingparry()
	end
	if curStep == 32 and not middlescroll and not downscroll then
		doTweenY('tutor1','atkTutor1',150,2,'CircInOut')
		doTweenY('tutor2','atkTutor2',175,3,'CircInOut')
		doTweenY('tutor3','atkTutor3',200,4,'CircInOut')
		runTimer('nds',15)
	elseif curStep == 32 and middlescroll and not downscroll then
		doTweenY('tutor1','atkTutor1',150,2,'CircInOut')
		doTweenY('tutor2','atkTutor2',175,3,'CircInOut')
		doTweenY('tutor3','atkTutor3',200,4,'CircInOut')
		runTimer('nds',15)
	elseif curStep == 32 and not middlescroll and downscroll then
		doTweenY('tutor1','atkTutor1',500,2,'CircInOut')
		doTweenY('tutor2','atkTutor2',525,3,'CircInOut')
		doTweenY('tutor3','atkTutor3',550,4,'CircInOut')
		runTimer('ds',15)
	elseif curStep == 32 and middlescroll and downscroll then
		doTweenY('tutor1','atkTutor1',500,2,'CircInOut')
		doTweenY('tutor2','atkTutor2',525,3,'CircInOut')
		doTweenY('tutor3','atkTutor3',550,4,'CircInOut')
		runTimer('ds',15)
	end
	if curStep == 2592 then
	 doTweenAlpha('aaaaaa','ATTACK!',1,1,'linear')
	 setProperty('ATTACK!.shake',0.1,0.1)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'nds' then
	 doTweenY('tutor4','atkTutor1',-150,2,'CircInOut')
	 doTweenY('tutor5','atkTutor2',-125,3,'CircInOut')
	 doTweenY('tutor6','atkTutor3',-100,4,'CircInOut')
	elseif tag == 'ds' then 
	 doTweenY('tutor4','atkTutor1',800,2,'CircInOut')
	 doTweenY('tutor5','atkTutor2',825,3,'CircInOut')
	 doTweenY('tutor6','atkTutor3',850,4,'CircInOut')
	end
end

function onTweenCompleted(tag)
	if tag == 'tutor6' then
	 removeLuaText('atkTutor1')
	 removeLuaText('atkTutor2')
	 removeLuaText('atkTutor3')
	end
end