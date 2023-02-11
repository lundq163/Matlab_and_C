% Jacob Lundquist

function Minesweeper

EMPTY = 0;
MINE = 1;
CLICKED = 2;
CLKMINE = 3;
lives = 3;
Nrows = 5;
Ncols = 6;
m = zeros(Nrows,Ncols);

for i = 1:7
    r = randi(Nrows);
    c = randi(Ncols);
    m(r,c) = MINE;
end

progress = (Nrows*Ncols)-sum(m==MINE,'all');

ph = uipanel;
ph.Position = [10 10 80 80]/100;
for i = 1:Nrows
    for j = 1:Ncols
        w = 1/Ncols;
        h = 1/Nrows;
        x = j*w-w;
        y = i*h-h;
        btn_array{i,j}                 = uicontrol;
        btn_array{i,j}.Parent          = ph;
        btn_array{i,j}.Units           = 'normalized';
        btn_array{i,j}.Position        = [x y w h];
        btn_array{i,j}.BackgroundColor = [0.5 0.5 0.5];
        btn_array{i,j}.FontSize        = 40;
        btn_array{i,j}.Callback        = {@button_update,i,j};
    end
end

% button update 
    function button_update (~,~,row,col)
      if flag_btn.Value == 0
        if m(row,col) == MINE
            btn_array{row,col}.BackgroundColor = [1 0 0];
            btn_array{row,col}.String = 'X';
            m(row,col) = CLKMINE;
            update_lives
            btn_array{row,col}.Enable = 'inactive';
            if lives == 0
                    for i = 1:Nrows
                        for j = 1:Ncols
                            btn_array{i,j}.Enable          = 'inactive';
                            btn_array{i,j}.String          = 'out of lives :(';
                            btn_array{i,j}.FontSize        = 10;
                            btn_array{i,j}.BackgroundColor = [1 0 0];
                        end
                    end
            end
        elseif m(row,col) == EMPTY 
            btn_array{row,col}.String = num2str(clue(row,col));
            btn_array{row,col}.Enable = 'inactive';
            update_progress
            m(row,col) = CLICKED;
                x = sum(m==MINE,'all');
                y = numel(m)-sum(m==CLICKED,'all')-sum(m==CLKMINE,'all');
                z = x/y*100;
                score_probability.String = [num2str(z) '%'];
                if x/y == 1
                    for i = 1:Nrows
                        for j = 1:Ncols
                            btn_array{i,j}.Enable          = 'inactive';
                            btn_array{i,j}.String          = 'you win :)';
                            btn_array{i,j}.FontSize        = 10;
                            btn_array{i,j}.BackgroundColor = [0 1 0];
                        end
                    end
                end
        else
          if m(row,col)==MINE
              btn_array{row,col}.BackgroundColor = [1 0 0];
              btn_array{row,col}.String          = 'X';
              m(row,col) = CLKMINE;
          end
        end
      elseif flag_btn.Value == 1
          if m(row,col)==MINE
            btn_array{row,col}.BackgroundColor = [0.5 0 0];
            btn_array{row,col}.String = 'X';
            btn_array{row,col}.Enable = 'inactive';
          end

      end
    end
    
    
    function [y] = clue(i,j)
        if i == 1
            rows = i:i+1;
        elseif i == Nrows
            rows = i-1:i;
        else
            rows = i-1:i+1;
        end
        if j == 1
            cols = j:j+1;
        elseif j == Ncols
            cols = j-1:j;
        else
            cols = j-1:j+1;
        end
        y = sum(m(rows,cols)==MINE,'all');
    end

    function reset(~,~)
        m = zeros(5,6);
        lives = 3;
        for i = 1:Nrows
            for j = 1:Ncols
                 btn_array{i,j}.Enable          = 'on';
                 btn_array{i,j}.BackgroundColor = [0.5 0.5 0.5];
                 btn_array{i,j}.FontSize        = 40;
                 btn_array{i,j}.String          = '';
            end
        end
        for i = 1:7
              r = randi(Nrows);
              c = randi(Ncols);
              m(r,c) = MINE;
        end
        progress = (Nrows*Ncols)-sum(m==MINE,'all');
        score_probability.String = '0%';
        score_progress.String    = num2str(progress);
    end

    function hint(~,~)
        for i = 1:Nrows
            for j = 1:Ncols
                if m(i,j)==EMPTY
                    btn_array{i,j}.BackgroundColor = [0 1 0];
                    return
                end
            end
        end
    end

    function reveal(~,~)
        for i = 1:Nrows
            for j = 1:Ncols
                if m(i,j)==MINE
                    btn_array{i,j}.BackgroundColor = [0 0 1];
                    btn_array{i,j}.String          = 'X';
                    return
                end
            end
        end
    end

    function update_lives 
        lives = lives - 1;
        score_lives.String = num2str(lives);
    end

    function update_progress
        progress = progress - 1;
        score_progress.String = num2str(progress);
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
    about_btn.Callback = 'msgbox(''How to play: click buttons without clicking mines. If mine is clicked then you lose a life. You have three lives. If you click all the of empty buttons with out losing all your lives then you win. You can use a hint to tell you where a safe spot is and you get to reveal the location of a mine only once. The flag button allows you to check if there is a mine underneath a button.'')';
    about_btn.String   = 'ABOUT';

    score_lives = uicontrol;
    score_lives.Style    = 'text';
    score_lives.Units    = 'normalized';
    score_lives.Position = [0.2 0.92 0.05 0.05];
    score_lives.String   = lives;

    disp_lives          = uicontrol;
    disp_lives.Style    = 'text';
    disp_lives.Units    = 'normalized';
    disp_lives.Position = [0.1 0.92 0.075 0.05];
    disp_lives.String   = 'Lives';

    score_probability = uicontrol;
    score_probability.Style    = 'text';
    score_probability.Units    = 'normalized';
    score_probability.Position = [0.4 0.92 0.15 0.05];
    score_probability.String   = '0%';

    disp_probability          = uicontrol;
    disp_probability.Style    = 'text';
    disp_probability.Units    = 'normalized';
    disp_probability.Position = [0.3 0.92 0.1 0.05];
    disp_probability.String   = 'Probability:';

    score_progress = uicontrol;
    score_progress.Style    = 'text';
    score_progress.Units    = 'normalized';
    score_progress.Position = [0.7 0.92 0.05 0.05];
    score_progress.String   = progress;

    disp_progress          = uicontrol;
    disp_progress.Style    = 'text';
    disp_progress.Units    = 'normalized';
    disp_progress.Position = [0.6 0.92 0.1 0.05];
    disp_progress.String   = 'Progress:';

    reset_btn          = uicontrol;
    reset_btn.Style    = 'pushbutton';
    reset_btn.Units    = 'normalized';
    reset_btn.Position = [0.90 0.25 0.09 0.05];
    reset_btn.Callback = @reset;
    reset_btn.String   = 'RESET';

    hint_btn          = uicontrol;
    hint_btn.Style    = 'pushbutton';
    hint_btn.Units    = 'normalized';
    hint_btn.Position = [0.90 0.35 0.09 0.05];
    hint_btn.Callback = @hint;
    hint_btn.String   = 'HINT';
 
    flag_btn          = uicontrol;
    flag_btn.Style    = 'togglebutton';
    flag_btn.Units    = 'normalized';
    flag_btn.Position = [0.90 0.45 0.09 0.05];
    flag_btn.String   = 'FLAG';

    reveal_btn          = uicontrol;
    reveal_btn.Style    = 'pushbutton';
    reveal_btn.Units    = 'normalized';
    reveal_btn.Position = [0.90 0.55 0.09 0.05];
    reveal_btn.Callback = @reveal;
    reveal_btn.String   = 'REVEAL';
end
