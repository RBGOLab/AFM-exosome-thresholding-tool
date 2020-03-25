function  declump_ButtonDownFcn(im, hit, app)

% disp("Hello")
dcSub = (hit.IntersectionPoint(1:2));
dcInd = sub2ind(size(app.I.Height.bw), round(dcSub(2)), round(dcSub(1)));
% hold(app.UIAxes_4, 'on');
% plot(app.UIAxes_4, dcSub(1), dcSub(2), 'r+')

for dx = 1:app.I.ExsnLocs.NumObjects
    
    if any(dcInd == app.I.ExsnLocs.PixelIdxList{dx})
        
        tDCO = zeros(size(app.I.Height.bw));%temp declump object
        tDCO(app.I.ExsnLocs.PixelIdxList{dx}) = 1;
        
%         figure(45), imagesc(tDCO)
        
        
        D = bwdist(~tDCO);
        %figure(46), imagesc(D)
        
        D = -D;
        D(~tDCO) = Inf;
        
        L = watershed(D);
        L(~tDCO) = 0;
        
        Lbw = bwconncomp(L);
        
%         figure(46), imagesc(L)
%                 if Lbw.NumObjects > 2

        % Sometimes declumping finds more than 2 exosomes
        % Here we remove the smallest one
        if Lbw.NumObjects > 2
    
            while numel(unique(L)) > 3
        
                [~, minOb] = min(cellfun(@numel, Lbw.PixelIdxList));
        
                 L(Lbw.PixelIdxList{minOb}) = 0;
                 Lbw = bwconncomp(L);
            end
        end
        
%         figure(47), imagesc(L)
        
        %%% Need to check if the declumping has found seperate obejcts,
        %%% then update the bw
        
        
        if Lbw.NumObjects > 1
            rgb = label2rgb(L,'jet',[.5 .5 .5]);
%             figure(1);
            app.h4 = imagesc(app.UIAxes_4, rgb); drawnow;
%             imshow(rgb,'InitialMagnification','fit')
%             title('Watershed transform of D')
            
            if strcmp(questdlg('Accept declumped object?'), 'Yes')
                
                app.I.ExsnLocs.NumObjects = app.I.ExsnLocs.NumObjects + 1;%numel(unique(L)) - 2;
                x = unique(L(L>0));
                for ex = 1:2  %max(L(:))
                    
                    if ex == 1
                        
                        app.I.ExsnLocs.PixelIdxList{dx} = find(L == x(ex));
                        
                    else
                        idx = numel(app.I.ExsnLocs.PixelIdxList) + 1;
                        app.I.ExsnLocs.PixelIdxList{idx} = find(L == x(ex));
                    end
                    
                end
                
            end
            
           
            
        else
            
            msgbox('Could not declump object')
            
        end
        break
    end
    
end % end loop through objects

app.I.Height.bw = zeros(size(app.I.Height.bw));
app.UIAxes_4.Title.String = 'Height Processed';
for dx = 1:app.I.ExsnLocs.NumObjects % need to rebuild the bw height mask after declump
   app.I.Height.bw(app.I.ExsnLocs.PixelIdxList{dx}) = 1;   
end

app.h4 = imagesc(app.UIAxes_4, app.I.Height.data.*app.I.Height.bw); drawnow;

end

