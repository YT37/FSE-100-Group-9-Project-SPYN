% global key
% InitKeyboard();

% brick = ConnectBrick("Wheels9");
% brick.ColorCode(1);

% startMoving = 0;
numLeft = 0;

while 1
    pause(0.1);

    distance = brick.UltrasonicDist(3);
    threshold = 10;

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

    % switch key
    %     case 'uparrow'
    %         while(startMoving == 0)
    %             pause(0.1)
    % 
    %             brick.MoveMotor('A', -100);
    %             brick.MoveMotor('D', -100);
    % 
    %             distance = brick.UltrasonicDist(3);
    %             disp(distance);
    % 
    %             if(distance > 30)
    %                 brick.MoveMotor('A', -100);
    %                 brick.MoveMotor('D', -100);
    %             else
    %                 brick.MoveMotor('A', -50);
    %                 brick.MoveMotor('D', 50);
    %             end
    %         end
    % 
    %     case 'downarrow'
    %         brick.MoveMotor('A', 100);
    %         brick.MoveMotor('D', 100);
    % 
    %     case 'leftarrow'
    %         brick.MoveMotor('A', -50);
    %         brick.MoveMotor('D', 50);
    % 
    %     case 'rightarrow'
    %         brick.MoveMotor('A', 50);
    %         brick.MoveMotor('D', -50);
    % 
    %     case 'q'
    %         brick.StopMotor('A'); 
    %         brick.StopMotor('D'); 
    % 
    %         startMoving = 1;
    % 
    %     case 'p'
    %        brick.MoveMotorAngleRel('B', -1000, 1000, 'Brake');
    %     case 'd'
    %        brick.MoveMotorAngleRel('B', 1000, 1000, 'Brake');
    %     case 'c'   
    %         color_rgb = brick.ColorRGB(1);
    %         fprintf("\tRed: %d\n", color_rgb(1));
    %         fprintf("\tGreen: %d\n", color_rgb(2));
    %         fprintf("\tBlue: %d\n", color_rgb(3));
    % end
% end

% CloseKeyboard();