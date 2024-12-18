global key
InitKeyboard();

% brick = ConnectBrick("Wheels9");
brick.SetColorMode(1, 2);

startMoving = 0;

threshold = 37;
sideThreshold = 75;

turningSpeed = 0.65;
forwardSpeed = 0.65;

rightSpeed = 50;
leftSpeed = 50;

Yellow = 4;
Green = 3;
Blue = 2;

startColor = Blue;
pickupColor = Green;
endColor = Yellow;


while true
    pause(0.1);

    switch key
        case 's'
            color = brick.ColorCode(1);
            disp(color)

            if(color == startColor)
                startMoving = 1;
            end

            while(startMoving == 1)
                auto(brick, pickupColor, threshold, sideThreshold, rightSpeed, leftSpeed, turningSpeed, forwardSpeed);
    
                stop(brick);
                startMoving = 0;
            end

        case 'm'
            color = brick.ColorCode(1);
            disp(color)

            if(color == pickupColor)
                startMoving = 1;
            end

            while(startMoving == 1)
                auto(brick, endColor, threshold, sideThreshold, rightSpeed, leftSpeed, turningSpeed, forwardSpeed);
    
                stop(brick);
                startMoving = 0;
            end
        case 'h'
            brick.playTone(300, 300, 500);
            pause(0.1);
            brick.playTone(300, 300, 50);
            pause(0.1);
            brick.playTone(300, 300, 50);
            pause(0.1);
            brick.playTone(300, 300, 500);
            pause(0.1);
            brick.playTone(300, 300, 50);
            pause(0.1);
            brick.playTone(300, 300, 1000);
            pause(0.1);

        case 'uparrow'
            brick.MoveMotor('A', -rightSpeed);
            brick.MoveMotor('D', -leftSpeed);

        case 'downarrow'
            brick.MoveMotor('A', rightSpeed);
            brick.MoveMotor('D', leftSpeed);

        case 'leftarrow'
            brick.MoveMotor('A', -rightSpeed);
            brick.MoveMotor('D', leftSpeed);

        case 'rightarrow'
            brick.MoveMotor('A', rightSpeed);
            brick.MoveMotor('D', -leftSpeed);

        case 'q'
            brick.StopMotor('A'); 
            brick.StopMotor('D'); 

        case 'p'
           brick.MoveMotorAngleRel('B', -1000, 1000, 'Brake');
        case 'd'
           brick.MoveMotorAngleRel('B', 1000, 1000, 'Brake');
    end
end

CloseKeyboard();

function auto(brick, endColor, threshold, sideThreshold, rightSpeed, leftSpeed, turningSpeed, forwardSpeed)
  color = brick.ColorCode(1);

    while(color ~= endColor)
        color = brick.ColorCode(1);
        distance = brick.UltrasonicDist(3);
        
        brick.MoveMotor('A', -rightSpeed);
        brick.MoveMotor('D', -leftSpeed);
    
        if(color == 5)
           brick.StopMotor('A'); 
           brick.StopMotor('D'); 
    
           brick.playTone(100, 800, 500);
           pause(0.75);
           brick.playTone(100, 800, 500); 
           pause(1);
    
           brick.MoveMotor('A', -250);
           brick.MoveMotor('D', -250);
        end
    
        if(distance >= sideThreshold)
            brick.MoveMotor('A', rightSpeed);
            brick.MoveMotor('D', -leftSpeed);
            pause(turningSpeed - 0.2);
    
            brick.MoveMotor('A', -rightSpeed);
            brick.MoveMotor('D', -leftSpeed);
            pause(forwardSpeed + 0.25);
        end
    
        if(distance <= threshold)
            touch = brick.TouchPressed(2);
    
            if(touch)
                brick.MoveMotor('A', rightSpeed);
                brick.MoveMotor('D', leftSpeed);
                pause(forwardSpeed);
                
                brick.MoveMotor('A', -rightSpeed);
                brick.MoveMotor('D', leftSpeed);
                pause(turningSpeed);
            end
       
        else
            touch = brick.TouchPressed(2);
    
            if(touch)
                brick.MoveMotor('A', rightSpeed);
                brick.MoveMotor('D', leftSpeed);
                pause(forwardSpeed);
                
                brick.MoveMotor('A', rightSpeed);
                brick.MoveMotor('D', -leftSpeed);
                pause(turningSpeed);
            end
        end
    end
end

function stop(brick) 
    brick.StopMotor('A'); 
    brick.StopMotor('D'); 
    
    brick.playTone(100, 800, 500);
    pause(0.75);
    brick.playTone(100, 800, 500);
    pause(1);
end