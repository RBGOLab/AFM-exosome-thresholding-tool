function im_ButtonDownFcn(im, hit, app)

mouse_pos = (hit.IntersectionPoint(1:2));
disp(mouse_pos);

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