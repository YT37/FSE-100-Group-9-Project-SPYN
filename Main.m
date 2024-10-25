global key
InitKeyboard();

% brick = ConnectBrick("Wheels9");
brick.SetColorMode(1, 2);

startMoving = 0;
numLeft = 0;

while 1
    pause(0.1);

    switch key
        case 'a'
            color = brick.ColorCode(1);
            if(color == 2)
                startMoving = 1;
            end
    
            while(startMoving == 1)
                while(color ~= 3)
                     color = brick.ColorCode(1);
        
                     distance = brick.UltrasonicDist(3);
                     threshold = 10;
        
                     if(color == 5)
                       brick.StopMotor('A'); 
                       brick.StopMotor('D'); 
        
                       pause(1);
        
                       brick.MoveMotor('A', -50);
                       brick.MoveMotor('D', -50);
                     end
        
                     if(color == 2)
                       brick.StopMotor('A'); 
                       brick.StopMotor('D'); 
                       
                       brick.playTone(100, 800, 500);
                       pause(0.75); 
                       brick.playTone(100, 800, 500); 
                       pause(1);
        
                       brick.MoveMotor('A', -100);
                       brick.MoveMotor('D', -100);
                     end                 
                     
                    if(distance < threshold)
                        if(numLeft < 3)
                            brick.MoveMotor('A', 50);
                            brick.MoveMotor('D', -50);
                            pause(1)
                
                            brick.MoveMotor('A', -50);
                            brick.MoveMotor('D', -50);
                            pause(0.5)
                
                            numLeft = numLeft + 1;
                        else
                            brick.MoveMotor('A', -50);
                            brick.MoveMotor('D', 50);
                            pause(1)
                
                            brick.MoveMotor('A', -50);
                            brick.MoveMotor('D', 50);
                            pause(1)
                
                            brick.MoveMotor('A', -50);
                            brick.MoveMotor('D', -50);
                            pause(0.5)
                
                           numLeft = numLeft - 1;
                        end
                    else
                        brick.MoveMotor('A', -50);
                        brick.MoveMotor('D', -50);
                    end
                end
        
                brick.StopMotor('A'); 
                brick.StopMotor('D'); 
        
                brick.playTone(100, 800, 500);
                pause(0.75);
                brick.playTone(100, 800, 500);
                pause(0.75); 
                brick.playTone(100, 800, 500); 
        
                pause(1);
        
                startMoving = 0;
            end

        case 'uparrow'
            brick.MoveMotor('A', -100);
            brick.MoveMotor('D', -100);

        case 'downarrow'
            brick.MoveMotor('A', 100);
            brick.MoveMotor('D', 100);

        case 'leftarrow'
            brick.MoveMotor('A', -50);
            brick.MoveMotor('D', 50);

        case 'rightarrow'
            brick.MoveMotor('A', 50);
            brick.MoveMotor('D', -50);

        case 'q'
            brick.StopMotor('A'); 
            brick.StopMotor('D'); 

            startMoving = 0;

        case 'p'
           brick.MoveMotorAngleRel('B', -1000, 1000, 'Brake');
        case 'd'
           brick.MoveMotorAngleRel('B', 1000, 1000, 'Brake');
    end
end

CloseKeyboard();