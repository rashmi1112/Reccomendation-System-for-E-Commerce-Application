function ActualMatrix = fillFinalMatrix(ActualMatrix,Y)
  for i = 1:size(ActualMatrix,2)
    idx_pred = find(ActualMatrix(:,i)==0);
    ActualMatrix(idx_pred,i) = round(Y(idx_pred,i));
  end
end
