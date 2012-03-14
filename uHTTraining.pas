unit uHTTraining;

interface

procedure CalculateTraining(aStartJaar, aStartDagen, aStartNiveau,
  aConditiePerc, aDoelNiveau, aCoachLevel: integer; aStartSubNiveau, aDoelsubNiveau, aTrainingSoort: double;
  var aEindJaar, aEindDagen: integer);

const
  TR_KEEPEN = 0.31;
  TR_VERDEDIGEN = 0.1705;
  TR_POSITIESPEL = 0.2010;
  TR_VLEUGELSPEL = 0.29;
  TR_PASSEN = 0.2180;
  TR_SCOREN = 0.1935;
  TR_SPELHERVATTEN = 1.1625;


implementation

uses
  Math, Dialogs;

procedure CalculateTraining(aStartJaar, aStartDagen, aStartNiveau,
  aConditiePerc, aDoelNiveau, aCoachLevel: integer; aStartSubNiveau,aDoelsubNiveau, aTrainingSoort: double;
  var aEindJaar, aEindDagen: integer);
var
  polinom: array[0..20] of double;
  agekoef: array[0..17] of double;
  skillkoef: array[0..19] of double;
  assistkoef: array[0..10] of double;
  coachkoef: array[0..8] of double;
  agetable: array[0..17] of double;

  coachK, assistK, intensK, staminaK, trainK, totalK: double;
  years, days, level: integer;
  sublevel: double;
  years0, years1, age0, skill0lost, ageee: double;
  shtraf, oldweek, drop, age1, age1old, ageold: double;

  lev, i, agge: integer;
  xxx1, yyy1, xxx: double;
  stolH, stolI: double;
  ageeeold: double;
  //sh: integer;
  shtrafx: double;
  resyears, resdays: double;
begin
  polinom[0] := 0;
  polinom[1] := 0.04912625;
  polinom[2] := 0.225855;
  polinom[3] := 0.39528625;
  polinom[4] := 0.55742;
  polinom[5] := 0.71225625;
  polinom[6] := 0.859795;
  polinom[7] := 1.00003625;
  polinom[8] := 1.13298;
  polinom[9] := 1.25862625;
  polinom[10] := 1.376975;
  polinom[11] := 1.48802625;
  polinom[12] := 1.59178;
  polinom[13] := 1.68823625;
  polinom[14] := 1.777395;
  polinom[15] := 1.85925625;
  polinom[16] := 1.93382;
  polinom[17] := 2.00108625;
  polinom[18] := 2.061055;
  polinom[19] := 2.11372625;
  polinom[20] := 2.1591;

  agekoef[0] := 1;
  agekoef[1] := 0.982;
  agekoef[2] := 0.963;
  agekoef[3] := 0.946;
  agekoef[4] := 0.928;
  agekoef[5] := 0.911;
  agekoef[6] := 0.894;
  agekoef[7] := 0.877;
  agekoef[8] := 0.861;
  agekoef[9] := 0.845;
  agekoef[10] := 0.830;
  agekoef[11] := 0.814;
  agekoef[12] := 0.799;
  agekoef[13] := 0.784;
  agekoef[14] := 0.770;
  agekoef[15] := 0.756;
  agekoef[16] := 0.742;
  agekoef[17] := 0.728;

  skillkoef[0] := 0.3520;
  skillkoef[1] := 0.3761;
  skillkoef[2] := 0.4038;
  skillkoef[3] := 0.4360;
  skillkoef[4] := 0.4740;
  skillkoef[5] := 0.5194;
  skillkoef[6] := 0.5747;
  skillkoef[7] := 0.6435;
  skillkoef[8] := 0.7316;
  skillkoef[9] := 0.8482;
  skillkoef[10] := 1.0105;
  skillkoef[11] := 1.2519;
  skillkoef[12] := 1.3625;
  skillkoef[13] := 1.5000;
  skillkoef[14] := 1.6761;
  skillkoef[15] := 1.9112;
  skillkoef[16] := 2.2443;
  skillkoef[17] := 2.7608;
  skillkoef[18] := 3.6967;
  skillkoef[19] := 6.0892;

  assistkoef[0] := 0.970000;
  assistkoef[1] := 0.98222;
  assistkoef[2] := 0.98631;
  assistkoef[3] := 0.98914;
  assistkoef[4] := 0.99138;
  assistkoef[5] := 0.99326;
  assistkoef[6] := 0.99490;
  assistkoef[7] := 0.99635;
  assistkoef[8] := 0.99767;
  assistkoef[9] := 0.99888;
  assistkoef[10] := 1.000000;

  coachkoef[0] := 0;
  coachkoef[1] := 0;
  coachkoef[2] := 0;
  coachkoef[3] := 0;
  coachkoef[4] := 0.774;
  coachkoef[5] := 0.867;
  coachkoef[6] := 0.9430;
  coachkoef[7] := 1;
  coachkoef[8] := 1.045;

  agetable[0] := 0.000;
  agetable[1] := 16.000;
  agetable[2] := 31.704;
  agetable[3] := 47.117;
  agetable[4] := 62.246;
  agetable[5] := 77.094;
  agetable[6] := 91.668;
  agetable[7] := 105.972;
  agetable[8] := 120.012;
  agetable[9] := 133.791;
  agetable[10] := 147.316;
  agetable[11] := 160.591;
  agetable[12] := 173.620;
  agetable[13] := 186.408;
  agetable[14] := 198.960;
  agetable[15] := 211.279;
  agetable[16] := 223.370;
  agetable[17] := 235.238;

  coachK := coachkoef[aCoachLevel];
  assistK := assistkoef[10];
  intensK := 100/100;
  staminaK :=(100-aConditiePerc)/100;

  trainK := aTrainingSoort;

  //$('skillname').get('value');
  {<option value="0.31">Keeper</option>
          <option value="0.1705">Defending</option>

          <option value="0.0855">Defensive positions</option>
          <option value="0.29">Crossing (Winger)</option>
          <option value="0.174">Wing attack</option>
          <option value="0.2010">Playmaking</option>
          <option value="0.1935">Scoring</option>
          <option value="0.09">Shooting</option>

          <option value="0.2180">Short passes</option>
          <option value="0.185">Through passes</option>
          <option value="0.93">Set pieces</option>
          <option value="1.1625">Set pieces +25%</option>
}

  totalK := coachK*assistK*intensK*staminaK*trainK;
  years := aStartJaar;
  days := aStartDagen;
  level := aStartNiveau;
  sublevel := aStartSubNiveau; // /100;
  years0 := agetable[years-17];
  years1 := agetable[years-16];
  age0 := (days/112)*(years1-years0)+years0;
  skill0lost := Math.Power(6.0896*totalK,1/0.72);
  ageee :=years*1+days/112;
  shtraf := 0;
  //oldweek := years*112+days*1;
  //drop := 0;
  age1 := years*1+days/112;
  age1old := 0;
  ageold := 0;
  resyears := 0;
  resdays := 0;
  //weekss := 0;

  for lev := level to aDoelNiveau do
  begin
    if (lev < 9) then
    begin
      xxx1 := (Math.Power(lev+aDoelSubNiveau,1.72)-1)*(1/6.0896/1.72);
    end
    else
    begin
      xxx1 := 2.45426+(1/4.7371/1.96)*Math.Power(lev+aDoelSubNiveau-5,1.96);
    end;

    if (level<9) then
    begin
      yyy1 :=(Math.Power(level+sublevel,1.72)-1)*(1/6.0896/1.72);
    end
    else
    begin
      yyy1 := 2.45426+Math.Power(level+sublevel-5,1.96)*(1/4.7371/1.96);
    end;

    if (xxx1 > yyy1) then
    begin
      xxx := (xxx1-yyy1)/totalK+age0;

      for i := 17 to 34 do
      begin
        if (xxx<=agetable[i-17]) then
          break;
      end;

      agge := i-1;  // G
      stolH := agetable[agge-17];
      stolI := agetable[agge-16];
      ageeeold := ageee;
      ageee := agge+(xxx-stolH)/(stolI-stolH);

      if (lev>(level+sublevel+1)) then
      begin
        //sh := 1;
        shtrafx := 1/16-ageee+ageeeold;
        if (shtrafx>0) then
        begin
          shtraf := shtraf+shtrafx;
        end
      end
      else
      begin
        //sh := 2;
        shtrafx := (1/16-ageee+years*1+days/112)*(lev-(level+sublevel));
        if (shtrafx>0) then
        begin
          shtraf := shtraf+shtrafx;
        end;
      end;

      if (lev>15) then
      begin
        drop := (0.00112/3)*(Math.Power((lev-15),3)-Math.Power((lev-16),3));
      end
      else
      begin
        drop :=0;
      end;
      if (lev<=15) then
      begin
        age1 := ageee;
      end;
      if (lev>15) then
      begin
        age1 := age1+(ageee-ageeeold)/(1-drop*(ageee-ageeeold)*16);
      end;

      resyears := Math.floor(age1+shtraf+0.0089);
      resdays := Math.floor((age1+shtraf-resyears+0.0089)*112);
      //weekss := ((resyears*112+resdays)-(oldweek))/7;
      //oldweek := resyears*112+resdays;
      //if (resdays<10) then
      //begin
      //  resdays := '0'+resdays;
      //end;

      if (resyears>31) then
      begin
        ShowMessage('Het aantal jaren komt boven de 32 uit, hier is geen goede calculatie voor mogelijk!');
        break;
      end;
    end;
    //if (isNaN(resyears)) break;

  end;

  aEindJaar := Ceil(resyears);
  aEindDagen := Ceil(resdays);
  //UpdateGlobalSkill(aTrainingSoort, aDoelNiveau);
end;


end.
