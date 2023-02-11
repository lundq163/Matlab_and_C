% Jacob Lundquist

function TikTakToe
turn = 0;
m = zeros(3,3);
Nrows = 3;
Ncols = 3;
Xwins = 0;
Ohwins = 0;
ties = 0;



ph = uipanel;
ph.Position = [10 10 80 80]/100;
for i = 1:Nrows
    for j = 1:Ncols
        w = 1/Ncols;
        h = 1/Nrows;
        x = j*w-w;
        y = i*h-h;
        btn_array{i,j} = uicontrol;
        btn_array{i,j}.Parent = ph;
        btn_array{i,j}.Units = 'normalized';
        btn_array{i,j}.Position = [x y w h];
        btn_array{i,j}.BackgroundColor = [0.5 0.5 0.5];
        btn_array{i,j}.FontSize = 60;
        btn_array{i,j}.Callback = {@button_update,i,j};
    end
end

%buttons
    quit_btn          = uicontrol;
    quit_btn.Style    = 'pushbutton';
    quit_btn.Units    = 'normalized';
    quit_btn.Position = [0.90 0.05 0.09 0.05];
    quit_btn.Callback = 'close';
    quit_btn.String   = 'QUIT';
   
    about_btn          = uicontrol;
    about_btn.Style    = 'pushbutton';
    about_btn.Units    = 'normalized';
    about_btn.Position = [0.90 0.15 0.09 0.05];
    about_btn.Callback = 'msgbox(''Click on easy or hard to choose where your opponent plays. Click next to go to the next game.'')';
    about_btn.String   = 'ABOUT';

    next_btn          = uicontrol;
    next_btn.Style    = 'pushbutton';
    next_btn.Units    = 'normalized';
    next_btn.Position = [0.90 0.25 0.09 0.05];
    next_btn.Callback = @button_reset;
    next_btn.String   = 'NEXT';

    opp1_btn          = uicontrol;
    opp1_btn.Callback = @opponent1;
    opp1_btn.Style    = 'pushbutton';
    opp1_btn.Units    = 'normalized';
    opp1_btn.Position = [0.10 0.03 0.09 0.05];
    opp1_btn.String   = 'EASY';


    opp2_btn          = uicontrol;
    opp2_btn.Callback = @opponent2;
    opp2_btn.Style    = 'pushbutton';
    opp2_btn.Units    = 'normalized';
    opp2_btn.Position = [0.20 0.03 0.09 0.05];
    opp2_btn.String   = 'HARD';
    

% scoreboard
    score_Xwins          = uicontrol;
    score_Xwins.Style    = 'text';
    score_Xwins.Units    = 'normalized';
    score_Xwins.Position = [0.2 0.92 0.05 0.05];

    disp_Xwins          = uicontrol;
    disp_Xwins.Style    = 'text';
    disp_Xwins.Units    = 'normalized';
    disp_Xwins.Position = [0.1 0.92 0.075 0.05];
    disp_Xwins.String   = 'X WINS';

    score_Ohwins          = uicontrol;
    score_Ohwins.Style    = 'text';
    score_Ohwins.Units    = 'normalized';
    score_Ohwins.Position = [0.5 0.92 0.05 0.05];

    disp_Ohwins          = uicontrol;
    disp_Ohwins.Style    = 'text';
    disp_Ohwins.Units    = 'normalized';
    disp_Ohwins.Position = [0.4 0.92 0.075 0.05];
    disp_Ohwins.String   = 'O WINS';

    score_ties          = uicontrol;
    score_ties.Style    = 'text';
    score_ties.Units    = 'normalized';
    score_ties.Position = [0.8 0.92 0.05 0.05];

    disp_ties          = uicontrol;
    disp_ties.Style    = 'text';
    disp_ties.Units    = 'normalized';
    disp_ties.Position = [0.7 0.92 0.075 0.05];
    disp_ties.String   = 'TIES';

% button update
    function button_update (~,~,row,col)
        turn = turn + 1;
        btn_array{row,col}.Enable = 'inactive';
        if (rem(turn,2) == 1)
            btn_array{row,col}.String = 'X';
            m(row,col) = 1;
        else 
            btn_array{row,col}.String = 'O';
            m(row,col) = -1;
        end
        check4end()
    end

    

% check for end
    function check4end
        if sum(m(1,:)) == 3
            'X wins';
            disable_btns
            update_Xscoreboard
        elseif sum(m(2,:)) == 3
            'X wins';
            disable_btns
            update_Xscoreboard
        elseif sum(m(3,:)) == 3
            'X wins';
            disable_btns
            update_Xscoreboard
        elseif sum(m(:,1)) == 3
            'X wins';
            disable_btns
            update_Xscoreboard
        elseif sum(m(:,2)) == 3
            'X wins';
            disable_btns
            update_Xscoreboard
        elseif sum(m(:,3)) == 3
            'X wins';
            disable_btns
            update_Xscoreboard
        elseif m(1,1)+m(2,2)+m(3,3) == 3
            'X wins';
            disable_btns
            update_Xscoreboard
        elseif m(1,3)+m(2,2)+m(3,1) == 3
            'X wins';
            disable_btns
            update_Xscoreboard
        elseif sum(m(1,:)) == -3
            'O wins';
            disable_btns
            update_Oscoreboard
        elseif sum(m(2,:)) == -3
            'O wins';
            disable_btns
            update_Oscoreboard
        elseif sum(m(3,:)) == -3
            'O wins';
            disable_btns
            update_Oscoreboard
        elseif sum(m(:,1)) == -3
            'O wins';
            disable_btns
            update_Oscoreboard
        elseif sum(m(:,2)) == -3
            'O wins';
            disable_btns
            update_Oscoreboard
        elseif sum(m(:,3)) == -3
            'O wins';
            disable_btns
            update_Oscoreboard
        elseif m(1,1)+m(2,2)+m(3,3) == -3
            'O wins';
            disable_btns
            update_Oscoreboard
        elseif m(1,3)+m(2,2)+m(3,1) == -3
            'O wins';
            disable_btns
            update_Oscoreboard
        elseif turn == 9
            'tie';
            disable_btns
            update_Tscoreboard
        else
        end
    end

% disable buttons
    function disable_btns
        opp1_btn.Enable = 'inactive';
        opp2_btn.Enable = 'inactive';
        for i = 1:3
            for j = 1:3
            btn_array{i,j}.Enable = 'inactive';
            end
        end
    end

% update scoreboard
    function update_Xscoreboard 
        Xwins = Xwins + 1;
        score_Xwins.String = num2str(Xwins);
    end

    function update_Oscoreboard
        Ohwins = Ohwins + 1;
        score_Ohwins.String = num2str(Ohwins);
    end

    function update_Tscoreboard
        ties = ties + 1;
        score_ties.String = num2str(ties);
    end

% ** button reset **
    function button_reset (~,~,row,col)
         m = zeros(3,3);
         turn = 0;
         opp1_btn.Enable = 'on';
         opp2_btn.Enable = 'on';
       for i = 1:Nrows
            for j = 1:Ncols
                btn_array{i,j}.String = '';
                btn_array{i,j}.Enable = 'on';               
            end
        end
    end

% ** opponents **
    function opponent1(~,~)
        row = randi([1 3]);
        col = randi([1 3]);
        while m(row,col) ~= 0
            row = randi([1 3]);
            col = randi([1 3]);
        end
        button_update([],[],row,col)
    end

    function opponent2(~,~)
        if sum(m(1,:)) == 2
            row = 1;
            col = find(m(1,:)==0);
        elseif sum(m(2,:)) == 2
            row = 2;
            col = find(m(2,:)==0);
        elseif sum(m(3,:)) == 2
            row = 3;
            col = find(m(3,:)==0);
        elseif sum(m(:,1)) == 2
            row = find(m(:,1)==0);
            col = 1;
        elseif sum(m(:,2)) == 2
            row = find(m(:,2)==0);
            col = 2;
        elseif sum(m(:,3)) == 2
            row = find(m(:,3)==0);
            col = 3;
        elseif m(1,1)+m(2,2)+m(3,3) == 2
            row = find([m(1,1),m(2,2),m(3,3)]==0);
            col = find([m(1,1),m(2,2),m(3,3)]==0);
        elseif m(1,3)+m(2,2)+m(3,1) == 2
            row = find([m(1,3),m(2,2),m(3,1)]==0);
            col = find([m(3,1),m(2,2),m(1,3)]==0);
        elseif sum(m(1,:)) == -2
            row = 1;
            col = find(m(1,:)==0);
        elseif sum(m(2,:)) == -2
            row = 2;
            col = find(m(2,:)==0);
        elseif sum(m(3,:)) == -2
            row = 3;
            col = find(m(3,:)==0);
        elseif sum(m(:,1)) == -2
            row = find(m(:,1)==0);
            col = 1;
        elseif sum(m(:,2)) == -2
            row = find(m(:,2)==0);
            col = 2;
        elseif sum(m(:,3)) == -2
            row = find(m(:,3)==0);
            col = 3;
        elseif m(1,1)+m(2,2)+m(3,3) == -2
            row = find([m(1,1),m(2,2),m(3,3)]==0);
            col = find([m(1,1),m(2,2),m(3,3)]==0);
        elseif m(1,3)+m(2,2)+m(3,1) == -2
            row = find([m(1,3),m(2,2),m(3,1)]==0);
            col = find([m(3,1),m(2,2),m(1,3)]==0);
        else
            row = randi([1 3]);
            col = randi([1 3]);
            while m(row,col) ~= 0
            row = randi([1 3]);
            col = randi([1 3]);
            end
        end
         button_update([],[],row,col)
       end



end