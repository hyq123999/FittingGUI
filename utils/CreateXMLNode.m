function returnValue = CreateXMLNode( name, T_vec, Soc_vec, values)
returnValue = '';
T = MakeReadableNumber(T_vec');
S = MakeReadableNumber(Soc_vec);
val = MakeReadableNumber(values);

% Creates complete element
if strcmp(name, 'Rser')
    returnValue = [
    '<Rser class="OhmicResistance">\n' ...
    ' <Object class="LookupObj2dWithState">\n' ...
    CreateLookup(val, T, S), ...
    ' </Object>\n' ...
    '</Rser>\n'];
% Creates only lookups
elseif strcmp(name, 'R_ct_A')
    returnValue = [
     ' <R_ct_A_lookup class="LookupObj2dWithState">\n' ...
    CreateLookup(val, T, S), ...
    ' </R_ct_A_lookup >\n'];
elseif strcmp(name, 'Tau_dl_A')
    returnValue = [
     ' <Tau_dl_A_lookup class="LookupObj2dWithState">\n' ...
    CreateLookup(val, T, S), ...
    ' </Tau_dl_A_lookup>\n'];
elseif strcmp(name, 'RMP')
        returnValue = [
     ' <RMP_lookup class="LookupObj2dWithState">\n' ...
    CreateLookup(val, T, S), ...
    ' </RMP_lookup>\n'];
elseif strcmp(name, 'R_ct_B')
     returnValue = [
     ' <R_ct_B_lookup class="LookupObj2dWithState">\n' ...
    CreateLookup(val, T, S), ...
    ' </R_ct_B_lookup >\n'];
elseif strcmp(name, 'Tau_dl_B')
       returnValue = [
     ' <Tau_dl_B_lookup class="LookupObj2dWithState">\n' ...
    CreateLookup(val, T, S), ...
    ' </Tau_dl_B_lookup>\n']; 
elseif strcmp(name, 'R_D_B')
     returnValue = [
     ' <R_D_B_lookup class="LookupObj2dWithState">\n' ...
    CreateLookup(val, T, S), ...
    ' </R_D_B_lookup>\n'];
elseif strcmp(name, 'Tau_D_B')
    returnValue = [
     ' <Tau_D_B_lookup class="LookupObj2dWithState">\n' ...
    CreateLookup(val, T, S), ...
    ' </Tau_D_B_lookup>\n'];
elseif strcmp(name, 'R_DP')
    returnValue = [
     ' <R_DP_lookup class="LookupObj2dWithState">\n' ...
    CreateLookup(val, T, S), ...
    ' </R_DP_lookup>\n'];
elseif strcmp(name, 'Tau_DP')
    returnValue = [
     ' <Tau_DP_lookup class="LookupObj2dWithState">\n' ...
    CreateLookup(val, T, S), ...
    ' </Tau_DP_lookup>\n'];
elseif strcmp(name, 'R_slow')
     returnValue = [
     ' <R_slow_lookup class="LookupObj2dWithState">\n' ...
    CreateLookup(val, T, S), ...
    ' </R_slow_lookup>\n'];
elseif strcmp(name, 'Tau_slow')
    returnValue = [
     ' <Tau_slow_lookup class="LookupObj2dWithState">\n' ...
    CreateLookup(val, T, S), ...
    ' </Tau_slow_lookup>\n'];
elseif strcmp(name, 'UOCV')
    returnValue = [
     ' <UOCV_lookup class="LookupObj2dWithState">\n' ...
    CreateLookup(val, T, S), ...
    ' </UOCV_lookup >\n'];
elseif strcmp(name, 'ROCV')
    returnValue = [
     ' <ROCV_lookup class="LookupObj2dWithState">\n' ...
    CreateLookup(val, T, S), ...
    ' </ROCV_lookup >\n'];
elseif strcmp(name, 'COCV')
    returnValue = [
     ' <COCV_lookup class="LookupObj2dWithState">\n' ...
    CreateLookup(val, T, S), ...
    ' </COCV_lookup >\n'];
elseif strcmp(name, 'ReFit_R_D_B')
    returnValue = [
     ' <ReFit_R_D_B_lookup class="LookupObj2dWithState">\n' ...
    CreateLookup(val, T, S), ...
    ' </ReFit_R_D_B_lookup >\n'];
elseif strcmp(name, 'ReFit_Tau_D_B')
    returnValue = [
     ' <ReFit_Tau_D_B_lookup class="LookupObj2dWithState">\n' ...
    CreateLookup(val, T, S), ...
    ' </ReFit_Tau_D_B_lookup >\n'];
elseif strcmp(name, 'ReFit_R_slow')
    returnValue = [
     ' <ReFit_R_slow_lookup class="LookupObj2dWithState">\n' ...
    CreateLookup(val, T, S), ...
    ' </ReFit_R_slow_lookup >\n'];
elseif strcmp(name, 'ReFit_Tau_slow')
    returnValue = [
     ' <ReFit_Tau_slow_lookup class="LookupObj2dWithState">\n' ...
    CreateLookup(val, T, S), ...
    ' </ReFit_Tau_slow_lookup >\n'];
else
%     error( [ 'Dont know how to extract parameter ', name])
end

function lookup = CreateLookup(val, T, S)
lookup = [ ...
    '  <RowState cacheref="Soc"/>\n' ...
    '  <ColState cacheref="ThermalState"/>\n' ...
    '  <LookupData>\n' ...
    , val, ...
    '\n</LookupData>\n ' ...
    '<MeasurementPointsRow>\n' ...
    , S, ...
    '\n</MeasurementPointsRow>\n' ...
    '<MeasurementPointsColumn>\n' ...
    ,T, ...
    '\n</MeasurementPointsColumn>\n'];

function val = MakeReadableNumber(values)
    val = mat2str(values);
    val = strrep( val(2:end-1), ' ' , ','); % erase []
    val = strrep( val, ';' , ';\n'); % erase []