global key
InitKeyboard();

% brick = ConnectBrick("Wheels9");
brick.ColorCode(1);

startMoving = 0;

while 1
    pause(0.1)
    switch key
        case 'uparrow'
           startMoving = 0;
           
            while(startMoving == 0)
                brick.MoveMotor('A', -100);
                brick.MoveMotor('D', -100);

                distance = brick.UltrasonicDist(3);
                disp(distance);
                
                if (distance < 30)
                    brick.StopMotor('A');
                    brick.StopMotor('D');

                    distance = brick.UltrasonicDist(3);
                    disp(distance);

                    x = randi([-10 10],1) 

                    if(x > 5)
                        brick.MoveMotor('A', -50);
                        brick.MoveMotor('D', 50);
                    end 
                    else if()

                    pause(0.2)

                    brick.MoveMotor('A', -100);
                    brick.MoveMotor('D', -100);
                end
            end

        case 'downarrow'
            brick.MoveMotor('A', 100);
            brick.MoveMotor('D', 100);

        case 'leftarrow'
            brick.MoveMotor('A', -50);
            brick.MoveMotor('D', 50);
            
        case 'rightarrow'
            brick.MoveMotor('A', 50);
            brick.MoveMotor('D', -50);

        case 's'
            brick.StopMotor('A'); 
            brick.StopMotor('D'); 

         case 'p'
           brick.MoveMotorAngleRel('B', -1000, 1000, 'Brake');
         case 'r'
           brick.MoveMotorAngleRel('B', 1000, 1000, 'Brake');
        case 'c'   
            color_rgb = brick.ColorRGB(1);  % Get Color on port 1
            fprintf("\tRed: %d\n", color_rgb(1));
            fprintf("\tGreen: %d\n", color_rgb(2));
            fprintf("\tBlue: %d\n", color_rgb(3));
    end
end

CloseKeyboard();