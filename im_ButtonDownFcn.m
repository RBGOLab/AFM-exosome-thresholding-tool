function im_ButtonDownFcn(im, hit, app)

mouse_pos = (hit.IntersectionPoint(1:2));
disp(mouse_pos);

% If first point selected


if app.pt % second point being selected
    plot(app.UIAxes, mouse_pos(1), mouse_pos(2), 'b+')
    
    l = sqrt(sum((mouse_pos - app.msPt1).^2));
    
    if app.SmallButton.Value % modify the smallest diameter
        app.SmallestEditField.Value = l;
        
    else % modify the largest diameter
        app.LargestEditField.Value = l;
        
    end
    
    pause(1);
    
    hold(app.UIAxes, 'on');
    app.h1 = imagesc(app.UIAxes, app.I.Height.data); drawnow; %hold on;
    app.UIAxes.XAxis.Limits = app.h1.XData;
    app.UIAxes.YAxis.Limits = app.h1.YData;
    app.h1.ButtonDownFcn = {@im_ButtonDownFcn, app};
    
else % first point being selected
    hold(app.UIAxes, 'on');
    plot(app.UIAxes, mouse_pos(1), mouse_pos(2), 'r+')
    app.msPt1 = mouse_pos;
    
end

if app.LargestEditField.Value > app.SmallestEditField.Value
    app.RemoveObjectsButton.Enable = true;
else
    app.RemoveObjectsButton.Enable = false;
end


% Change stat
app.pt = abs(app.pt - 1);
disp(app.pt);

% x = getline(app.h1);
% disp(x);

% try
%
%     v = app.celocs - mouse_pos;
%     nrm = zeros(numel(v)/2, 1);
%     for dx = 1:numel(v)/2
%
%         nrm(dx) = norm(v(dx, :));
%
%     end
%
%     [~, clN] = min(nrm);
%
%             if isempty(app.phnTypIds)
%                 app.phnTypIds{1} = [];
%                 app.phnTypIds{2} = [];
%             end
%
%             if app.Phenotype1Button.Value
%             app.phnTypIds{1}(end + 1) = clN;
%             app.CellIDPhenotype1EditField.Value = num2str(app.phnTypIds{1});
%
%             app.MessageLabel.Text = ['Cell ' num2str(clN) ' added to phenotype 1 training set' ]
%             else
%             app.phnTypIds{2}(end + 1) = clN;
%             app.CellIDPhenotype2EditField.Value = num2str(app.phnTypIds{2});
%             app.MessageLabel.Text = ['Cell ' num2str(clN) ' added to phenotype 2 training set' ]
%             end
%
% catch ME
%
%     app.MessageLabel.Text = ME.message;
%
% end