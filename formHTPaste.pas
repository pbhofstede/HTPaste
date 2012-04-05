unit formHTPaste;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ActnList, dxPageControl, cxCalendar, cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  ImgList, ExtCtrls, Db, dxmdaset, dxTL, dxDBCtrl, dxDBGrid;

type
  TfrmHTPaste = class(TForm)
    ActionList1: TActionList;
    actPaste: TAction;
    pcMain: TdxPageControl;
    tsDocs: TdxTabSheet;
    tsLink: TdxTabSheet;
    Label1: TLabel;
    btnConvert: TButton;
    mmU17From: TMemo;
    mmTo: TMemo;
    btnLink: TButton;
    mmLink: TMemo;
    edPostDatum: TcxDateEdit;
    cbSpelersnaam: TcxCheckBox;
    tbMasterfulIndex: TdxTabSheet;
    gbVaardigheden: TGroupBox;
    Keepen: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edKeepen: TdxCurrencyEdit;
    edVerdedigen: TdxCurrencyEdit;
    edPositiespel: TdxCurrencyEdit;
    edVleugelspel: TdxCurrencyEdit;
    edPassen: TdxCurrencyEdit;
    edScoren: TdxCurrencyEdit;
    edSpelhervatten: TdxCurrencyEdit;
    gpPositie: TGroupBox;
    Label8: TLabel;
    ImageList1: TImageList;
    ImgKeeper: TImage;
    Label9: TLabel;
    imgCD: TImage;
    Label10: TLabel;
    imgPMDef: TImage;
    imgOWB: TImage;
    Label11: TLabel;
    Label12: TLabel;
    imgIM: TImage;
    imgWing: TImage;
    Label13: TLabel;
    imgAtt: TImage;
    Label14: TLabel;
    imgTDFW: TImage;
    Label15: TLabel;
    tsU17talent: TdxTabSheet;
    mmU17talent: TMemo;
    btnU17talent: TButton;
    tsNTTalent: TdxTabSheet;
    Panel1: TPanel;
    mmNTTalent: TMemo;
    btnNTTalent: TButton;
    memNTTalent: TdxMemData;
    memNTTalentNAAM: TStringField;
    memNTTalentNU_JAREN: TSmallintField;
    memNTTalentNU_DAGEN: TSmallintField;
    memNTTalentSPELERID: TStringField;
    memNTTalentSPEC: TStringField;
    memNTTalentWEKEN_OUD: TSmallintField;
    memNTTalentWEKEN_TRAINING: TFloatField;
    memNTTalentKWALITEIT_INDEX: TFloatField;
    memNTTalentTRAINING_INDEX: TFloatField;
    dxDBGrid1: TdxDBGrid;
    dsNTTalent: TDataSource;
    dxDBGrid1RecId: TdxDBGridColumn;
    dxDBGrid1NAAM: TdxDBGridMaskColumn;
    dxDBGrid1NU_JAREN: TdxDBGridMaskColumn;
    dxDBGrid1NU_DAGEN: TdxDBGridMaskColumn;
    dxDBGrid1SPELERID: TdxDBGridMaskColumn;
    dxDBGrid1PM: TdxDBGridMaskColumn;
    dxDBGrid1PAS: TdxDBGridMaskColumn;
    dxDBGrid1DEF: TdxDBGridMaskColumn;
    dxDBGrid1SPEC: TdxDBGridMaskColumn;
    dxDBGrid1WEKEN_OUD: TdxDBGridMaskColumn;
    dxDBGrid1WEKEN_TRAINING: TdxDBGridMaskColumn;
    dxDBGrid1KWALITEIT_INDEX: TdxDBGridMaskColumn;
    dxDBGrid1TRAINING_INDEX: TdxDBGridMaskColumn;
    memNTTalentPM: TFloatField;
    memNTTalentPAS: TFloatField;
    memNTTalentDEF: TFloatField;
    memNTTalentKWALITEIT: TFloatField;
    dxDBGrid1KWALITEIT: TdxDBGridColumn;
    lblLoon: TLabel;
    cbU20: TcxCheckBox;
    lblIndexPMDef: TLabel;
    lblIndexCDef: TLabel;
    lblIndexKP: TLabel;
    lblIndexWB: TLabel;
    lblIndexIM: TLabel;
    lblIndexWG: TLabel;
    lblIndexSC: TLabel;
    lblIndexTDFW: TLabel;
    procedure btnConvertClick(Sender: TObject);
    procedure actPasteExecute(Sender: TObject);
    procedure btnLinkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edKeepenChange(Sender: TObject);
    procedure btnU17talentClick(Sender: TObject);
    procedure btnNTTalentClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FGK_Index: double;
    FCD_Index: double;
    FPMDef_Index: double;
    FOWB_Index: double;
    FIM_Index: double;
    FWing_Index: double;
    FSC_Index: double;
    FDFW_Index: double;
    FBezigMetCalculeren: Boolean;
    procedure VerwerkRegel(aLine: String);
    function GebDatum(aString: String; aAfwijking: integer): TDate;
    procedure GetIDsFromText(aText: String; var aIDList: TStringList);
    procedure CalculateNTPotential;
    procedure CalculateU20Potential;
    procedure CalculatePotential;

    function CalculateTrainingWeeks(aLeeftijdJaar, aLeeftijdDagen, aKeepen,
      aVerdedigen, aPositiespel, aVleugelSpel, aPassen, aScoren,
      aSpelhervatten: integer; aCurKeepen, aCurVerdedigen, aCurPostiespel,
      aCurVleugelSpel, aCurPassen, aCurScoren,
      aCurSpelhervatten: double): double;
    procedure SetGK_Index(const Value: double);
    procedure LoadImage(aImage: TImage; aWaarde: double);
    procedure SetCD_Index(const Value: double);
    procedure SetPMDef_Index(const Value: double);
    procedure SetOWB_Index(const Value: double);
    procedure SetIM_Index(const Value: double);
    procedure SetWing_Index(const Value: double);
    procedure SetSC_Index(const Value: double);
    procedure SetDFW_Index(const Value: double);
    procedure GetBuildInfo(aFileName: String; var v1, v2, v3, v4: Word);
    procedure VerwerkU17Talent(aLine: String);
    function GetNiveau(var aWaarde: String; aPrevWaarde: double = 0): double;
    procedure GetBestPositions(var vBestPOS1: String; var vBestPOS2: String; var vBest1: String; var vBest2: string);
    procedure VerwerkNTTalent(aText: String);
    procedure MaakNTTalentPost;
    procedure GetTraining(aGetal: String; var aTraining: double; var aExtraTraining: integer);
    procedure CalculateWages(aVerdedigen, aPositiespel, aVleugelspel,
      aPassen, aScoren, aSpelhervatten: double);
    procedure ReadIni;
    procedure WriteIni;
    { Private declarations }
  public
    { Public declarations }
    property GK_Index:double read FGK_Index write SetGK_Index;
    property CD_Index:double read FCD_Index write SetCD_Index;
    property PMDef_Index:double read FPMDef_Index write SetPMDef_Index;
    property OWB_Index:double read FOWB_Index write SetOWB_Index;
    property IM_Index: double read FIM_Index write SetIM_Index;
    property Wing_Index: double read FWing_Index write SetWing_Index;
    property SC_Index:double read FSC_Index write SetSC_Index;
    property DFW_Index:double read FDFW_Index write SetDFW_Index;
  end;

var
  frmHTPaste: TfrmHTPaste;

implementation
uses
  uBibString, Math, Clipbrd, uBibMath, uBibConv, uHTTraining, uHattrick, inifiles;

{$R *.DFM}

procedure TfrmHTPaste.btnConvertClick(Sender: TObject);
var
  vCount: integer;
begin
  mmTo.Clear;

  for vCount := 0 to mmU17From.Lines.Count - 1 do
  begin
    try
      if Trim(mmU17From.Lines[vCount]) <> '' then
      begin
        VerwerkRegel(mmU17From.Lines[vCount]);
      end;
    except
      on E: Exception do
        Application.MessageBox(PChar('Er is een fout opgetreden tijdens het converteren van de volgende regel: '+#13#10+
                                     mmU17From.Lines[vCount] + #13#10#13#10 +
                                     'Foutmelding: ' + E.Message),
                               PChar('HTPaste'), MB_OK);
    end;
  end;

  Clipboard.AsText := mmTo.Lines.Text;
end;

function TfrmHTPaste.GebDatum(aString: String; aAfwijking: integer): TDate;
var
  vJaren,
  vDagen: integer;
  vTemp: String;
begin
  vTemp := Copy(aString, 1, Pos('y', aString) - 1);
  vJaren := StrToInt(vTemp);

  vTemp := Copy(aString, Pos('y', aString) + 1, Length(aString));
  vDagen := StrToInt(vTemp);

  Result := Date - aAfwijking - ((vJaren - 15) * 112) - vDagen;
end;

procedure TfrmHTPaste.VerwerkRegel(aLine: String);
const
  C_JAREN = '="15"+rounddown(((today()-INDIRECT("J" & ROW( )))/"112");)';
  C_DAGEN = '=mod(today()-INDIRECT("J" & ROW( ));"112")';
  C_U20   = '=if(INDIRECT("AK" & ROW())<0;INDIRECT("AJ" & ROW());INDIRECT("AK" & ROW()))';
  C_REST  = #9 + '6-10-2008' +
            #9 + '24-1-2009' +
            #9 + '=INDIRECT("J" & ROW())-rounddown(("1"/"2")*(INDIRECT("J" & ROW())- INDIRECT("AG" & ROW()))/"112")*"224"' +
            #9 + '=INDIRECT("AI" & ROW()) - INDIRECT("AG" & ROW())' +
            #9 + '=INDIRECT("AI" & ROW()) - INDIRECT("AH" & ROW())';
var
  vPos,
  vPos2: integer;
  vTemp,
  vSpelerID,
  vTeamID,
  vVoornaam,
  vAchternaam,
  vCaptian: String;
  vSpec: String;
  vGebDatum: TDate;
begin
  vPos := Pos('(', aLine);

  if (vPos > 0) and
     (uBibString.StringContainingNumber(aLine)) then
  begin
    vTemp := Copy(aLine, vPos + 1, Length(aLine));
    vPos := Pos(')', vTemp);
    vTemp := Copy(vTemp, 1, vPos - 1);

    vSpelerID := vTemp;

    vTemp := Copy(aLine, vPos, Length(aLine));
    vPos := Pos(')_', vTemp);
    vTemp := Copy(vTemp, vPos + 2, Length(aLine));

    while (uBibString.StartsWith(vTemp, '_')) do
    begin
      vTemp := Copy(vTemp, 2, Length(vTemp));
    end;

    aLine := Copy(aLine, Pos(vTemp, aLine), Length(aLine));
    vPos := Pos('_', aLine);
    vPos2 := Pos('‚', aLine);
    if (vPos2 > 0) and
       (vPos2 < vPos) then
    begin
      vPos := vPos2;
    end;
    aLine := Copy(aLine, vPos, Length(aLine));
    vTemp := Copy(vTemp, 1, vPos - 1);
    uBibString.Splitsen(vTemp, ' ', vVoornaam, vAchternaam);


    vPos := Pos('(', aLine);
    vTemp := Copy(aLine, vPos + 1, Length(aLine));
    vPos := Pos(')', vTemp);
    vTemp := Copy(vTemp, 1, vPos - 1);
    vTeamID := vTemp;

    aLine := Copy(aLine, Pos(vTemp, aLine), Length(aLine));
    vPos := Pos('_', aLine);
    vPos2 := Pos('‚', aLine);
    if (vPos2 > 0) and
       (vPos2 < vPos) then
    begin
      vPos := vPos2;
    end;
    aLine := Copy(aLine, vPos, Length(aLine));


    vPos := Pos('1', aLine);
    vTemp := Copy(aLine, vPos, Pos('d', aLine) - vPos);

    vGebDatum := GebDatum(vTemp, Ceil(Date - edPostDatum.Date));

    aLine := Copy(aLine, Pos('d', aLine), Length(aLine));
    if Pos('Q', aLine) > 0 then
    begin
      vSpec := 'Q';
    end
    else if Pos('H', aLine) > 0 then
    begin
      vSpec := 'H';
    end
    else if Pos('P', aLine) > 0 then
    begin
      vSpec := 'P';
    end
    else if Pos('U', aLine) > 0 then
    begin
      vSpec := 'U';
    end
    else if Pos('T', aLine) > 0 then
    begin
      vSpec := 'T';
    end
    else if Pos('N', aLine) > 0 then
    begin
      vSpec := 'N';
    end
    else
    begin
      vSpec := '';
    end;

    if Pos('[C]', aLine) > 0 then
    begin
      vCaptian := 'Goed leider';
    end
    else
    begin
       vCaptian := '';
    end;


    if cbSpelersnaam.Checked then
    begin
      mmTo.Lines.Add(vVoornaam + #9 + vAchternaam + #9 + vSpelerID + #9 + vTeamID + #9 + #9 + #9 +
        #9 + #9 + #9 + DateToStr(vGebDatum) + #9 + C_JAREN + #9 + C_DAGEN + #9 + C_U20 + #9 + #9 + vSpec +
        #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + vCaptian + #9 + C_REST);
    end
    else
    begin
      mmTo.Lines.Add(vVoornaam + ' ' + vAchternaam + #9 + vSpelerID + #9 + vTeamID + #9 + #9 + #9 +
        #9 + #9 + #9 + DateToStr(vGebDatum) + #9 + C_JAREN + #9 + C_DAGEN + #9 + C_U20 + #9 + #9 + vSpec +
        #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + vCaptian + #9 + C_REST);
    end;
  end;
end;

procedure TfrmHTPaste.actPasteExecute(Sender: TObject);
var
  vTekst: TStringList;
  vFoutieveLastLine: Boolean;
  vCount: integer;
begin
  if (pcMain.ActivePage = tsDocs) then
  begin
    vTekst := TStringList.Create;

    try
      vTekst.Text := Clipboard.AsText;
      vFoutieveLastLine := FALSE;

      mmU17From.Clear;

      for vCount := 0 to vTekst.Count -1 do
      begin
        if uBibString.StartsWith(vTekst[vCount], '_') then
        begin
          if (vFoutieveLastLine) then
          begin
            mmU17From.Lines[mmU17From.Lines.Count -1] := mmU17From.Lines[mmU17From.Lines.Count -1] + vTekst[vCount];
          end
          else
          begin
            mmU17From.Lines.Add(vTekst[vCount]);
          end;
          vFoutieveLastLine := FALSE;
        end
        else
        begin
          vFoutieveLastLine := TRUE;
        end;
      end;
    finally
      vTekst.Free;
    end;
  end
  else if (pcMain.ActivePage = tsLink) then
  begin
    mmLink.Lines.Text := Clipboard.AsText;
  end
  else if (pcMain.ActivePage = tsU17talent) then
  begin
    mmU17talent.Lines.Text := Clipboard.AsText;
  end
  else if (pcMain.ActivePage = tsNTTalent) then
  begin
    mmNTTalent.Lines.Text := Clipboard.AsText;
  end;
end;

procedure TfrmHTPaste.btnLinkClick(Sender: TObject);
var
  vIdList: TStringList;
  vCount: integer;
begin
  mmTo.Clear;
  vIdList := TStringList.Create;

  GetIDsFromText(mmLink.Lines.Text, vIdList);

  for vCount := 0 to vIdList.Count - 1 do
  begin
    mmTo.Lines.Add(Format('[youthplayerid=%s]', [vIdList[vCount]]));
  end;

  Clipboard.AsText := mmTo.Lines.Text;
end;

procedure TfrmHTPaste.GetIDsFromText(aText: String; var aIDList: TStringList);
var
  vID,
  vPos: integer;
begin
  aText := Trim(aText);

  if (aText <> '') then
  begin
    try          
      vID := uBibConv.AnyStrToInt(aText);
    except
      vID := uBibConv.AnyStrToInt(Copy(aText, 1, Pos(' ', aText)));
    end;

    if vID > 0 then
    begin
      aIDList.Add(IntToStr(vID));
    end;

    vPos := Pos(IntToStr(vID), aText);
    if (vPos > 0) then
    begin
      aText := Copy(aText, vPos + Length(IntToStr(vID)), Length(aText));
      GetIDsFromText(aText, aIDList);
    end;
  end;
end;

procedure TfrmHTPaste.GetBuildInfo(aFileName: String; var v1, v2, v3, v4: Word);
var
  VerInfoSize: DWord;
  VerInfo: Pointer;
  VerValueSize: DWord;
  VerValue: PVSFixedFileInfo;
  Dummy: DWord;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(aFileName), dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(aFileName), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    v1 := dwFileVersionMS shr 16;
    v2 := dwFileVersionMS and $FFFF;
    v3 := dwFileVersionLS shr 16;
    v4 := dwFileVersionLS and $FFFF;
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

procedure TfrmHTPaste.FormCreate(Sender: TObject);
var
  v1, v2, v3, v4: Word;
begin
  ReadIni;
  pcMain.ActivePage := tsDocs;
  edPostDatum.Date := Date;
  cbSpelersnaam.Checked := TRUE;
  FBezigMetCalculeren := FALSE;
  CalculateNTPotential;

  GetBuildInfo(Application.ExeName, v1, v2, v3, v4);

  Caption := Format('%s [versie %d.%d', [Caption, v1, v2]);
  if (v3 > 0) then
  begin
    Caption := Format('%s%d', [Caption, v3]);
  end;
  Caption := Caption + ']';
end;

procedure TfrmHTPaste.edKeepenChange(Sender: TObject);
begin
  CalculatePotential;
end;

function TfrmHTPaste.CalculateTrainingWeeks(aLeeftijdJaar, aLeeftijdDagen:integer;
  aKeepen,aVerdedigen,aPositiespel,aVleugelSpel,aPassen,aScoren,aSpelhervatten:integer;
  aCurKeepen,aCurVerdedigen,aCurPostiespel,aCurVleugelSpel,aCurPassen,aCurScoren,aCurSpelhervatten:double):double;
var
  aJaar, aDagen: integer;
begin
  aJaar := 17;
  aDagen := 0;

  if (aKeepen > 0) then
  begin
    if (aCurKeepen > aKeepen) then
    begin
      uHTTraining.CalculateTraining(aJaar, aDagen, aKeepen, 15, Floor(aCurKeepen), 7,
        0, Frac(aCurKeepen), TR_KEEPEN, aJaar, aDagen);
    end
    else if (aKeepen > aCurKeepen) then
    begin
      uHTTraining.CalculateTraining(aLeeftijdJaar, aLeeftijdDagen, Max(0,Floor(aCurKeepen)), 15, aKeepen, 7,
        Frac(aCurKeepen),0, TR_KEEPEN, aLeeftijdJaar, aLeeftijdDagen);
    end;
  end;

  if (aVerdedigen > 0) then
  begin
    if (aCurVerdedigen > aVerdedigen) then
    begin
      uHTTraining.CalculateTraining(aJaar, aDagen, aVerdedigen, 15, Floor(aCurVerdedigen), 7,
        0, Frac(aCurVerdedigen), TR_VERDEDIGEN, aJaar, aDagen);
    end
    else if (aVerdedigen > aCurVerdedigen) then
    begin
      uHTTraining.CalculateTraining(aLeeftijdJaar, aLeeftijdDagen, Max(0,Floor(aCurVerdedigen)), 15, aVerdedigen, 7,
        Frac(aCurVerdedigen),0, TR_VERDEDIGEN, aLeeftijdJaar, aLeeftijdDagen);
    end;
  end;

  if (aPositiespel > 0) then
  begin
    if (aCurPostiespel > aPositiespel) then
    begin
      uHTTraining.CalculateTraining(aJaar, aDagen, aPositiespel, 15, Floor(aCurPostiespel), 7,
        0, Frac(aCurPostiespel), TR_POSITIESPEL, aJaar, aDagen);
    end
    else if (aPositiespel > aCurPostiespel) then
    begin
      uHTTraining.CalculateTraining(aLeeftijdJaar, aLeeftijdDagen, Max(0,Floor(aCurPostiespel)), 15, aPositiespel, 7,
        Frac(aCurPostiespel), 0,TR_POSITIESPEL, aLeeftijdJaar, aLeeftijdDagen);
    end;
  end;

  if (aVleugelSpel > 0) then
  begin
    if (aCurVleugelSpel > aVleugelSpel) then
    begin
      uHTTraining.CalculateTraining(aJaar, aDagen, aVleugelSpel, 15, Floor(aCurVleugelSpel), 7,
        0, Frac(aCurVleugelSpel), TR_VLEUGELSPEL, aJaar, aDagen);
    end
    else if (aVleugelSpel > aCurVleugelspel) then
    begin
      uHTTraining.CalculateTraining(aLeeftijdJaar, aLeeftijdDagen, Max(0,Floor(aCurVleugelSpel)), 15, aVleugelSpel, 7,
        Frac(aCurVleugelSpel), 0, TR_VLEUGELSPEL, aLeeftijdJaar, aLeeftijdDagen);
    end;
  end;

  if (aPassen > 0) then
  begin
    if (aCurPassen > aPassen) then
    begin
      uHTTraining.CalculateTraining(aJaar, aDagen, aPassen, 15, Floor(aCurPassen), 7,
        0, Frac(aCurPassen), TR_PASSEN, aJaar, aDagen);
    end
    else if (aPassen > aCurPassen) then
    begin
      uHTTraining.CalculateTraining(aLeeftijdJaar, aLeeftijdDagen, Max(0,Floor(aCurPassen)), 15, aPassen, 7,
        Frac(aCurPassen), 0, TR_PASSEN, aLeeftijdJaar, aLeeftijdDagen);
    end;
  end;

  if (aScoren > 0) then
  begin
    if (aCurScoren > aScoren) then
    begin
      uHTTraining.CalculateTraining(aJaar, aDagen, aScoren, 15, Floor(aCurScoren), 7,
        0, Frac(aCurScoren), TR_SCOREN, aJaar, aDagen);
    end
    else if (aScoren > aCurScoren) then
    begin
      uHTTraining.CalculateTraining(aLeeftijdJaar, aLeeftijdDagen, Max(0,Floor(aCurScoren)), 15, aScoren, 7,
        Frac(aCurScoren), 0, TR_SCOREN, aLeeftijdJaar, aLeeftijdDagen);
    end;
  end;

  if (aSpelhervatten > 0) then
  begin
    if (aCurSpelhervatten > aSpelhervatten) then
    begin
      uHTTraining.CalculateTraining(aJaar, aDagen, aSpelhervatten, 15, Floor(aCurSpelhervatten), 7,
        0, Frac(aCurSpelhervatten), TR_SPELHERVATTEN, aJaar, aDagen);
    end
    else if (aSpelhervatten > aCurSpelhervatten) then
    begin
      uHTTraining.CalculateTraining(aLeeftijdJaar, aLeeftijdDagen, Max(0,Floor(aCurSpelhervatten)), 15, aSpelhervatten, 7,
        Frac(aCurSpelhervatten), 0, TR_SPELHERVATTEN, aLeeftijdJaar, aLeeftijdDagen);
    end;
  end;


  result := ((aJaar * 16 * 7 + aDagen) - (aLeeftijdJaar * 16 * 7 + aLeeftijdDagen)) / 7;
end;

procedure TfrmHTPaste.CalculateNTPotential;
var
  vIndex: double;
begin
  GK_Index := CalculateTrainingWeeks(17,0,3,8,0,0,5,0,6,
    edKeepen.Value,edVerdedigen.Value,edPositiespel.Value,edVleugelspel.Value,
    edPassen.Value,edScoren.Value,edSpelhervatten.Value);

  CD_Index := CalculateTrainingWeeks(17,0,0,7,5,0,8,0,0,
    edKeepen.Value,edVerdedigen.Value,edPositiespel.Value,edVleugelspel.Value,
    edPassen.Value,edScoren.Value,edSpelhervatten.Value);

  PMDef_Index := CalculateTrainingWeeks(17,0,0,7,7,0,5,0,0,
    edKeepen.Value,edVerdedigen.Value,edPositiespel.Value,edVleugelspel.Value,
    edPassen.Value,edScoren.Value,edSpelhervatten.Value);

  OWB_Index := CalculateTrainingWeeks(17,0,0,7,5,6,5,0,0,
    edKeepen.Value,edVerdedigen.Value,edPositiespel.Value,edVleugelspel.Value,
    edPassen.Value,edScoren.Value,edSpelhervatten.Value);

  IM_Index := CalculateTrainingWeeks(17,0,0,5,7,0,7,0,0,
    edKeepen.Value,edVerdedigen.Value,edPositiespel.Value,edVleugelspel.Value,
    edPassen.Value,edScoren.Value,edSpelhervatten.Value);

  vIndex := CalculateTrainingWeeks(17,0,0,0,7,7,6,0,0,
    edKeepen.Value,edVerdedigen.Value,edPositiespel.Value,edVleugelspel.Value,
    edPassen.Value,edScoren.Value,edSpelhervatten.Value);

  if (edVerdedigen.Value >= 3) then
  begin
    Wing_Index := vIndex + ((edVerdedigen.Value - 3) * 2);
  end
  else
  begin
    Wing_Index := vIndex + (edVerdedigen.Value - 3);
  end;
  
  SC_Index := CalculateTrainingWeeks(17,0,0,0,0,6,7,7,0,
    edKeepen.Value,edVerdedigen.Value,edPositiespel.Value,edVleugelspel.Value,
    edPassen.Value,edScoren.Value,edSpelhervatten.Value);

  DFW_Index := CalculateTrainingWeeks(17,0,0,0,6,5,7,7,0,
    edKeepen.Value,edVerdedigen.Value,edPositiespel.Value,edVleugelspel.Value,
    edPassen.Value,edScoren.Value,edSpelhervatten.Value);
end;

procedure TfrmHTPaste.CalculateU20Potential;
begin
  GK_Index := CalculateTrainingWeeks(17,0,7,5,0,0,0,0,5,
    edKeepen.Value,edVerdedigen.Value,edPositiespel.Value,edVleugelspel.Value,
    edPassen.Value,edScoren.Value,edSpelhervatten.Value);

  CD_Index := CalculateTrainingWeeks(17,0,0,7,0,0,7,0,0,
    edKeepen.Value,edVerdedigen.Value,edPositiespel.Value,edVleugelspel.Value,
    edPassen.Value,edScoren.Value,edSpelhervatten.Value) +
    (edPositiespel.Value - 3);

  PMDef_Index := CalculateTrainingWeeks(17,0,0,7,6,0,0,0,0,
    edKeepen.Value,edVerdedigen.Value,edPositiespel.Value,edVleugelspel.Value,
    edPassen.Value,edScoren.Value,edSpelhervatten.Value) +
    (edPassen.Value - 3);

  OWB_Index := CalculateTrainingWeeks(17,0,0,7,0,7,0,0,0,
    edKeepen.Value,edVerdedigen.Value,edPositiespel.Value,edVleugelspel.Value,
    edPassen.Value,edScoren.Value,edSpelhervatten.Value) +
    (edPositiespel.Value - 4) +
    (edPassen.Value - 3);

  IM_Index := CalculateTrainingWeeks(17,0,0,0,7,0,0,0,0,
    edKeepen.Value,edVerdedigen.Value,edPositiespel.Value,edVleugelspel.Value,
    edPassen.Value,edScoren.Value,edSpelhervatten.Value) +
    (edVerdedigen.Value - 5) +
    ((edPassen.Value - 5) * 2);

  Wing_Index := CalculateTrainingWeeks(17,0,0,0,6,7,0,0,0,
    edKeepen.Value,edVerdedigen.Value,edPositiespel.Value,edVleugelspel.Value,
    edPassen.Value,edScoren.Value,edSpelhervatten.Value) +
    (edPassen.Value - 5);

  SC_Index := CalculateTrainingWeeks(17,0,0,0,0,0,7,7,0,
    edKeepen.Value,edVerdedigen.Value,edPositiespel.Value,edVleugelspel.Value,
    edPassen.Value,edScoren.Value,edSpelhervatten.Value) +
    (Max(edVleugelspel.Value - 3, 0));

  DFW_Index := CalculateTrainingWeeks(17,0,0,0,7,0,6,6,0,
    edKeepen.Value,edVerdedigen.Value,edPositiespel.Value,edVleugelspel.Value,
    edPassen.Value,edScoren.Value,edSpelhervatten.Value);
end;


procedure TfrmHTPaste.CalculateWages(aVerdedigen, aPositiespel, aVleugelspel,
  aPassen, aScoren, aSpelhervatten: double);
var
  vLoon, vMax: double;
  vKortingScoren, vKortingDef, vKortingPassen, vKortingVleugelspel, vKortingPositiespel:
    double;
begin
  {Je hoeft je spelers komend seizoen op hun verjaardag minder te betalen dan vroeger het geval zou zijn.
  De Spelersunie en de Federatie van Clubeigenaren hebben het volgende afgesproken:
  - 50 procent salariskorting op secundaire (tertaire, etc.) vaardigheden.
  - Alle veldspelers krijgen een salariskorting: hoe hoger de vaardigheid, des te groter de korting.
  Een goddelijke veldspeler met monoskills krijgt bijvoorbeeld een salaris dat 30 procent lager ligt,
  bij een reusachtige veldspeler is dat 15 procent, bij een briljante veldspeler 10 procent en bij een uitstekende veldspeler 5 procent.
  De vaardigheid ‘Passen’ leidt tot een lagere korting dan andere vaardigheden (maar zal veel profiteren van de korting
  op secundaire vaardigheden).}

  //8=5 9=6 10=8 11=10 12=11 13=12 14=14 15=15 16=17 17=19 18=22 19=25 20=30

  vMax := 0;

  vKortingScoren := 1;
  vKortingPassen := 1;
  vKortingDef := 1;
  vKortingVleugelspel := 1;
  vKortingPositiespel := 1;

  if (aVerdedigen > vMax) then
  begin
    vMax := aVerdedigen;
    vKortingScoren := 0.5;
    vKortingPassen := 0.5;
    if (vMax >= 8) then
    begin
      vKortingDef := 0.95;
    end
    else
    begin
      vKortingDef := 1;
    end;
    vKortingVleugelspel := 0.5;
    vKortingPositiespel := 0.5;
  end;

  if (aPositiespel > vMax) then
  begin
    vMax := aPositiespel;
    vKortingScoren := 0.5;
    vKortingPassen := 0.5;
    vKortingDef := 0.5;
    vKortingVleugelspel := 0.5;
    if (vMax >= 8) then
    begin
      vKortingPositiespel := 0.95;
    end
    else
    begin
      vKortingPositiespel := 1;
    end;
  end;

  if (aVleugelspel > vMax) then
  begin
    vMax := aVleugelspel;
    vKortingScoren := 0.5;
    vKortingPassen := 0.5;
    vKortingDef := 0.5;
    if (vMax >= 8) then
    begin
      vKortingVleugelspel := 0.95;
    end
    else
    begin
      vKortingVleugelspel := 1;
    end;
    vKortingPositiespel := 0.5;
  end;

  if (aScoren > vMax) then
  begin
    vMax := aScoren;
    if (vMax >= 8) then
    begin
      vKortingScoren := 0.95;
    end
    else
    begin
      vKortingScoren := 1;
    end;
    vKortingPassen := 0.5;
    vKortingDef := 0.5;
    vKortingVleugelspel := 0.5;
    vKortingPositiespel := 0.5;
  end;

  aScoren := Max(aScoren, 1);
  aVerdedigen := Max(aVerdedigen, 1);
  aPassen := Max(aPassen, 1);
  aVleugelspel := Max(aVleugelspel, 1);
  aPositiespel := Max(aPositiespel, 1);
  aSpelhervatten := Max(aSpelhervatten, 1); 

  vLoon :=
    ( 0.0014235 * Power((aScoren - 1),6.4) * vKortingScoren +
      0.00125 * Power((aVerdedigen - 1),6.4) * vKortingDef +
      0.00078 * Power((aPassen - 1),6.4) * vKortingPassen +
      0.00078 * Power((aVleugelspel - 1),6.4) * vKortingVleugelspel +
      0.0016 * Power((aPositiespel - 1),6.4) * vKortingPositiespel )
      
    * (0.0026 * aSpelhervatten + 1)  + 250;


  lblLoon.Caption := Format('Loon: %.0f',[vLoon]);
end;

procedure TfrmHTPaste.LoadImage(aImage:TImage; aWaarde:double);
begin
   if (aWaarde >= 0) then
  begin
    ImageList1.GetBitmap(2,aImage.Picture.Bitmap);
  end
  else if (aWaarde > -5) then
  begin
    ImageList1.GetBitmap(0,aImage.Picture.Bitmap);
  end
  else
  begin
    ImageList1.GetBitmap(1,aImage.Picture.Bitmap);
  end;
  aImage.Repaint;
end;

procedure TfrmHTPaste.SetGK_Index(const Value: double);
begin
  FGK_Index := Value;
  LoadImage(ImgKeeper, Value);
  lblIndexKP.Caption := Format('%.2f', [Value]);
end;

procedure TfrmHTPaste.SetCD_Index(const Value: double);
begin
  FCD_Index := Value;
  LoadImage(imgCD, Value);
  lblIndexCDef.Caption := Format('%.2f', [Value]);
end;

procedure TfrmHTPaste.SetPMDef_Index(const Value: double);
begin
  FPMDef_Index := Value;
  LoadImage(imgPMDef, Value);
  lblIndexPMDef.Caption := Format('%.2f', [Value]);
end;

procedure TfrmHTPaste.SetOWB_Index(const Value: double);
begin
  FOWB_Index := Value;
  LoadImage(imgOWB, Value);
  lblIndexWB.Caption := Format('%.2f', [Value]);
end;

procedure TfrmHTPaste.SetIM_Index(const Value: double);
begin
  FIM_Index := Value;
  LoadImage(imgIM, Value);
  lblIndexIM.Caption := Format('%.2f', [Value]);
end;

procedure TfrmHTPaste.SetWing_Index(const Value: double);
begin
  FWing_Index := Value;
  LoadImage(imgWing, Value);
  lblIndexWG.Caption := Format('%.2f', [Value]);
end;

procedure TfrmHTPaste.SetSC_Index(const Value: double);
begin
  FSC_Index := Value;
  LoadImage(imgAtt, Value);
  lblIndexSC.Caption := Format('%.2f', [Value]);
end;

procedure TfrmHTPaste.SetDFW_Index(const Value: double);
begin
  FDFW_Index := Value;
  LoadImage(imgTDFW, Value);
  lblIndexTDFW.Caption := Format('%.2f', [Value]);
end;

procedure TfrmHTPaste.btnU17talentClick(Sender: TObject);
var
  vText: String;
begin
  mmTo.Clear;

  vText := Trim(mmU17talent.Text);
  if (vText <> '') then
  begin
    VerwerkU17Talent(vText);
  end;
    
  Clipboard.AsText := mmTo.Lines.Text;
end;

procedure TfrmHTPaste.VerwerkU17Talent(aLine: String);
const
  cPOSTING =
    '[table]'+#13#10+
    '[tr][th colspan=4]%s [youthplayerid=%s][/th][/tr]'+#13#10+
    '[tr][td]17.0 jaar op: %s[/td][td]M-index:[/td][td]%s[/td][td]%s[/td][/tr]'+#13#10+
    '[tr][td]Specialiteit: [b]%s[/b][/td][td][/td][td]%s[/td][td]%s[/td][/tr]'+#13#10+
    '[tr][td]DEF: %s / %s[/td][td colspan=3]PM: %s / %s[/td][/tr]'+#13#10+
    '[tr][td]VL: %s / %s[/td][td colspan=3]PAS: %s / %s[/td][/tr]'+#13#10+
    '[tr][td]SCO: %s / %s[/td][td colspan=3]SP: %s / %s[/td][/tr]';
  cBIJZ =
    '[tr][td colspan=4]Bijzonderheden: %s[/td][/tr]';
  cCOMM =
    '[tr][td colspan=4]Communicatie: %s[/td][/tr]';
  cOPM =
    '[tr][td colspan=4]Opmerking: %s[/td][/tr]';
  cUPDATE =
    '[tr][td]Laatste update[/td][td colspan=3]%s[/td][/tr]';
  cEND =
    '[/table]';
var
  vSL: TStringList;
  vNaam,
  vSpelerID,
  vLaatsteUpdate,
  vGebDatumStr,
  vSpec,
  vDEF, vDEFPot,
  vPM, vPMPot,
  vVL, vVLPot,
  vPAS, vPASPot,
  vSCO, vSCOPot,
  vSP, vSPPot,
  vBijzonderheden,
  vCommunicatie,
  vOpmerkingen,
  vJarigStr,
  vBestPOS1,
  vBestPOS2,
  vBest1,
  vBest2: String;
  vGebDatum: TDate;
  vDEFFloat,
  vPMFloat, 
  vVLFloat,
  vPASFloat,
  vSCOFloat,
  vSPFloat,
  vIndex: double;
begin
  vSL := uBibString.StringToStringlist(aLine, [#9]);
  try
    vNaam := Format('%s %s', [vSL[0], vSL[1]]);
    vSpelerID := vSL[2];
    vLaatsteUpdate := vSL[5];
    vGebDatumStr := vSL[9];
    vGebDatum := uBibConv.AnyStrToDate(vGebDatumStr);
    vJarigStr := FormatDateTime('dddd dd-mm-yyyy', vGebDatum + (2 * 112));

    vSpec := uHattrick.FormatSpecialiteit(vSL[14]);
    if (vSpec = '') then
    begin
      vSpec := vSL[14];
    end;

    vPM := vSL[18];
    vPMFloat := GetNiveau(vPM);
    vPMPot := vSL[19];
    vPMFloat := GetNiveau(vPMPot, vPMFloat);

    vPAS := vSL[20];
    vPASFloat := GetNiveau(vPAS);
    vPASPot := vSL[21];
    vPASFloat := GetNiveau(vPASPot, vPASFloat);

    vVL := vSL[22];
    vVLFloat := GetNiveau(vVL);
    vVLPot := vSL[23];
    vVLFloat := GetNiveau(vVLPot, vVLFloat);

    vDEF := vSL[24];
    vDEFFloat := GetNiveau(vDEF);
    vDEFPot := vSL[25];
    vDEFFloat := GetNiveau(vDEFPot, vDEFFloat);

    vSCO := vSL[26];
    vSCOFloat := GetNiveau(vSCO);
    vSCOPot := vSL[27];
    vSCOFloat := GetNiveau(vSCOPot, vSCOFloat);

    vSP := vSL[28];
    vSPFloat := GetNiveau(vSP);
    vSPPot := vSL[29];
    vSPFloat := GetNiveau(vSPPot, vSPFloat);

    vBijzonderheden := vSL[30];
    vCommunicatie := 'goed';
    vOpmerkingen := vSL[31];


    CD_Index := CalculateTrainingWeeks(17,0,0,7,5,0,8,0,0,
      0,vDEFFloat,vPMFloat,vVLFloat,
      vPASFloat,vSCOFloat,vSPFloat);

    PMDef_Index := CalculateTrainingWeeks(17,0,0,7,7,0,5,0,0,
      0,vDEFFloat,vPMFloat,vVLFloat,
      vPASFloat,vSCOFloat,vSPFloat);

    OWB_Index := CalculateTrainingWeeks(17,0,0,7,5,6,5,0,0,
      0,vDEFFloat,vPMFloat,vVLFloat,
      vPASFloat,vSCOFloat,vSPFloat);

    IM_Index := CalculateTrainingWeeks(17,0,0,5,7,0,7,0,0,
      0,vDEFFloat,vPMFloat,vVLFloat,
      vPASFloat,vSCOFloat,vSPFloat);

    vIndex := CalculateTrainingWeeks(17,0,0,0,7,7,6,0,0,
      0,vDEFFloat,vPMFloat,vVLFloat,
      vPASFloat,vSCOFloat,vSPFloat);

    if (vDEFFloat >= 3) then
    begin
      Wing_Index := vIndex + ((vDEFFloat - 3) * 2);
    end
    else
    begin
      Wing_Index := vIndex + (vDEFFloat - 3);
    end;

    SC_Index := CalculateTrainingWeeks(17,0,0,0,0,6,7,7,0,
      0,vDEFFloat,vPMFloat,vVLFloat,
      vPASFloat,vSCOFloat,vSPFloat);

    DFW_Index := CalculateTrainingWeeks(17,0,0,0,6,5,7,7,0,
      0,vDEFFloat,vPMFloat,vVLFloat,
      vPASFloat,vSCOFloat,vSPFloat);

    GetBestPositions(vBestPOS1, vBestPOS2, vBest1, vBest2);

    mmTo.Text := Format(cPOSTING, [
      vNaam,
      vSpelerID,
      vJarigStr,
      vBestPOS1,
      vBest1,
      vSpec,
      vBestPOS2,
      vBest2,
      vDEF, vDEFPot,
      vPM, vPMPot,
      vVL, vVLPot,
      vPAS, vPASPot,
      vSCO, vSCOPot,
      vSP, vSPPot
    ]);

    if (Trim(vBijzonderheden) <> '') then
    begin
      mmTo.Lines.Add(Format(cBIJZ, [vBijzonderheden]));
    end;
    
    if (Trim(vCommunicatie) <> '') then
    begin
      mmTo.Lines.Add(Format(cCOMM, [vCommunicatie]));
    end;
    
    if (Trim(vOpmerkingen) <> '') then
    begin
      mmTo.Lines.Add(Format(cOPM, [vOpmerkingen]));
    end;
    
    if (Trim(vLaatsteUpdate) <> '') then
    begin
      mmTo.Lines.Add(Format(cUPDATE, [vLaatsteUpdate]));
    end;

    mmTo.Lines.Add(cEND);
  finally
    vSL.Free;
  end;
end;

function TfrmHTPaste.GetNiveau(var aWaarde: String; aPrevWaarde: double = 0): double;
begin
  Result := 0;
  
  if Trim(aWaarde) = '' then
  begin
    aWaarde := '?';
  end
  else
  begin
    Result := uBibConv.AnyStrToFloat(Trim(aWaarde));

    if (aPrevWaarde > Result) then
    begin
      Result := aPrevWaarde;
    end;
  end;
end;

procedure TfrmHTPaste.GetBestPositions(var vBestPOS1: String; var vBestPOS2: String; var vBest1: String; var vBest2: string);
var
  vPos1, vPos2: double;
begin
  vPos1 := -1;
  vPos2 := -1;

  if (CD_Index > vPos1) then
  begin
    vBestPOS2 := vBestPOS1;
    vPos2 := vPos1;
    vBestPOS1 := 'CD';
    vPos1 := CD_Index;
  end;

  if (PMDef_Index > vPos1) then
  begin
    vBestPOS2 := vBestPOS1;
    vPos2 := vPos1;
    vBestPOS1 := 'DEF';
    vPos1 := PMDef_Index;
  end
  else if (PMDef_Index > vPos2) then
  begin
    vBestPOS2 := 'DEF';
    vPos2 := PMDef_Index;
  end;

  if (OWB_Index > vPos1) then
  begin
    vBestPOS2 := vBestPOS1;
    vPos2 := vPos1;
    vBestPOS1 := 'OWB';
    vPos1 := OWB_Index;
  end
  else if (OWB_Index > vPos2) then
  begin
    vBestPOS2 := 'OWB';
    vPos2 := OWB_Index;
  end;

  if (IM_Index > vPos1) then
  begin
    vBestPOS2 := vBestPOS1;
    vPos2 := vPos1;
    vBestPOS1 := 'IM';
    vPos1 := IM_Index;
  end
  else if (IM_Index > vPos2) then
  begin
    vBestPOS2 := 'IM';
    vPos2 := IM_Index;
  end;

  if (Wing_Index > vPos1) then
  begin
    vBestPOS2 := vBestPOS1;
    vPos2 := vPos1;
    vBestPOS1 := 'WG';
    vPos1 := Wing_Index;
  end
  else if (Wing_Index > vPos2) then
  begin
    vBestPOS2 := 'WG';
    vPos2 := Wing_Index;
  end;

  if (SC_Index > vPos1) then
  begin
    vBestPOS2 := vBestPOS1;
    vPos2 := vPos1;
    vBestPOS1 := 'SC';
    vPos1 := SC_Index;
  end
  else if (SC_Index > vPos2) then
  begin
    vBestPOS2 := 'SC';
    vPos2 := SC_Index;
  end;

  if (DFW_Index > vPos1) then
  begin
    vBestPOS2 := vBestPOS1;
    vPos2 := vPos1;
    vBestPOS1 := 'DFW';
    vPos1 := DFW_Index;
  end
  else if (DFW_Index > vPos2) then
  begin
    vBestPOS2 := 'DFW';
    vPos2 := DFW_Index;
  end;

  if (vPos1 >= 0) then
  begin
    vBest1 := '+'+FloatToStr(uBibMath.RoundTo(vPos1, 1));
  end
  else if (vPos1 > -1) then
  begin
    vBest1 := FloatToStr(uBibMath.RoundTo(vPos1, 1));
  end
  else
  begin
    vBestPOS1 := '';
    vBest1 := '';
  end;

  if (vPos2 > 0) then
  begin
    vBest2 := '+'+FloatToStr(uBibMath.RoundTo(vPos2, 1));
  end  
  else if (vPos2 > -1) then
  begin
    vBest2 := FloatToStr(uBibMath.RoundTo(vPos2, 1));
  end
  else
  begin
    vBestPOS2 := '';
    vBest2 := '';
  end;
end;

procedure TfrmHTPaste.btnNTTalentClick(Sender: TObject);
var
  vText: String;
begin
  mmTo.Clear;
  if (memNTTalent.Active) then
  begin
    memNTTalent.Close;
  end;

  vText := Trim(mmNTTalent.Text);
  if (vText <> '') then
  begin
    memNTTalent.Open;
    VerwerkNTTalent(vText);

    MaakNTTalentPost;
  end;
end;

procedure TfrmHTPaste.VerwerkNTTalent(aText: String);
var
  vSLSpelers,
  vSLSpeler: TStringList;
  vCount,
  vExtraTraining: integer;
  vTraining: double;
begin
  vSLSpelers := uBibString.StringToStringlist(aText, [#13]);

  try
    for vCount := 0 to vSLSpelers.Count -1 do
    begin
      vSLSpeler := uBibString.StringToStringlist(vSLSpelers[vCount], [#9]);
      try
        vExtraTraining := 0;
        
        memNTTalent.Append;
        memNTTalent.FieldByName('NAAM').AsString := vSLSpeler[0];
        memNTTalent.FieldByName('SPELERID').AsString := vSLSpeler[1];
        memNTTalent.FieldByName('NU_JAREN').AsInteger := uBibConv.AnyStrToInt(vSLSpeler[2]);
        memNTTalent.FieldByName('NU_DAGEN').AsInteger := uBibConv.AnyStrToInt(vSLSpeler[3]);
        GetTraining(vSLSpeler[5], vTraining, vExtraTraining);
        memNTTalent.FieldByName('PM').AsFloat := vTraining;
        GetTraining(vSLSpeler[7], vTraining, vExtraTraining);
        memNTTalent.FieldByName('PAS').AsFloat := vTraining;   
        GetTraining(vSLSpeler[9], vTraining, vExtraTraining);
        memNTTalent.FieldByName('DEF').AsFloat := vTraining;
        memNTTalent.FieldByName('SPEC').AsString := Trim(UpperCase(vSLSpeler[11]));

        if (vExtraTraining > 0) then
        begin
          memNTTalent.FieldByName('NAAM').AsString := Format('%s (+ %d)', [vSLSpeler[0], vExtraTraining]);
        end
        else
        if (vExtraTraining < 0) then
        begin
          memNTTalent.FieldByName('NAAM').AsString := Format('%s (%d)', [vSLSpeler[0], vExtraTraining]);
        end;
        memNTTalent.FieldByName('WEKEN_OUD').AsInteger := ((memNTTalent.FieldByName('NU_JAREN').AsInteger - 17) * 16) +
                                                          Ceil(memNTTalent.FieldByName('NU_DAGEN').AsInteger / 7);
        memNTTalent.FieldByName('WEKEN_TRAINING').AsFloat := vExtraTraining + uBibMath.RoundTo(CalculateTrainingWeeks(17, 0,
          0,7,7,0,5,0,0,
          0,memNTTalent.FieldByName('DEF').AsFloat,memNTTalent.FieldByName('PM').AsFloat,0,memNTTalent.FieldByName('PAS').AsFloat,0,0), 2);

        if memNTTalent.FieldByName('SPEC').AsString = 'H' then
        begin
          memNTTalent.FieldByName('KWALITEIT').AsFloat := memNTTalent.FieldByName('WEKEN_TRAINING').AsFloat;
        end
        else if memNTTalent.FieldByName('SPEC').AsString = 'U' then
        begin
          memNTTalent.FieldByName('KWALITEIT').AsFloat := memNTTalent.FieldByName('WEKEN_TRAINING').AsFloat - 13;
        end
        else if memNTTalent.FieldByName('SPEC').AsString = 'T' then
        begin
          memNTTalent.FieldByName('KWALITEIT').AsFloat := memNTTalent.FieldByName('WEKEN_TRAINING').AsFloat - 10;
        end
        else
        begin
          memNTTalent.FieldByName('KWALITEIT').AsFloat := memNTTalent.FieldByName('WEKEN_TRAINING').AsFloat - 20;
        end;

        memNTTalent.FieldByName('TRAINING_INDEX').AsFloat := uBibMath.RoundTo(
          memNTTalent.FieldByName('WEKEN_TRAINING').AsFloat / memNTTalent.FieldByName('WEKEN_OUD').AsInteger * 100, 2);
        
        memNTTalent.FieldByName('KWALITEIT_INDEX').AsFloat := uBibMath.RoundTo(
          memNTTalent.FieldByName('KWALITEIT').AsFloat / memNTTalent.FieldByName('WEKEN_OUD').AsInteger * 100, 2);

        memNTTalent.Post;
      finally
        vSLSpeler.Free;
      end;
    end;
  finally
    vSLSpelers.Free;
  end;
end;

procedure TfrmHTPaste.MaakNTTalentPost;
const
  cPOSTING =
    '[table]'+#13#10+
    '[tr][th]Naam[/th][th]Jaren[/th][th]Dagen[/th][th]PM[/th][th]PAS[/th][th]DEF[/th][th]SPEC[/th][th]TRA.[/th][th]KWA.[/th][th]TR.IND.[/th][th]KWA.IND.[/th][/tr]'+#13#10;
  cLINE =
    '[tr][td]%s[/td][td]%d[/td][td]%d[/td][td]%.1f[/td][td]%.1f[/td][td]%.1f[/td][td]%s[/td][td]%.2f[/td][td]%.2f[/td][td]%.2f[/td][td]%.2f[/td][/tr]';
begin
  mmTo.Lines.Text := cPOSTING;

  memNTTalent.SortOptions := [soDesc];
  memNTTalent.SortedField := 'KWALITEIT_INDEX';
  memNTTalent.First;
  while (not memNTTalent.Eof) do
  begin
    mmTo.Lines.Add(Format(cLINE, [
      memNTTalent.FieldByName('NAAM').AsString,
      memNTTalent.FieldByName('NU_JAREN').AsInteger,
      memNTTalent.FieldByName('NU_DAGEN').AsInteger,
      memNTTalent.FieldByName('PM').AsFloat,
      memNTTalent.FieldByName('PAS').AsFloat,
      memNTTalent.FieldByName('DEF').AsFloat,
      memNTTalent.FieldByName('SPEC').AsString,
      memNTTalent.FieldByName('WEKEN_TRAINING').AsFloat,
      memNTTalent.FieldByName('KWALITEIT').AsFloat,
      memNTTalent.FieldByName('TRAINING_INDEX').AsFloat,
      memNTTalent.FieldByName('KWALITEIT_INDEX').AsFloat
      ]));
    memNTTalent.Next;
  end;
  mmTo.Lines.Add('[/table]');
  
  Clipboard.AsText := mmTo.Lines.Text;
end;

procedure TfrmHTPaste.GetTraining(aGetal: String; var aTraining: double; var aExtraTraining: integer);
var
  vPos: integer;
begin
  aGetal := Trim(aGetal);

  vPos := Pos('-', aGetal);
  if (vPos > 0) then
  begin
    aExtraTraining := aExtraTraining - uBibConv.AnyStrToInt(Copy(aGetal, vPos + 1, Length(aGetal)));

    aGetal := Copy(aGetal, 1, vPos - 1);
    aTraining := uBibConv.AnyStrToInt(aGetal);
  end
  else
  begin
    aTraining := uBibConv.AnyStrToInt(aGetal);

    vPos := Pos('.', aGetal);
    if (vPos > 0) then
    begin
      aTraining := uBibConv.AnyStrToFloat(aGetal);
    end;

    vPos := Pos(',', aGetal);
    if (vPos > 0) then
    begin
      aTraining := uBibConv.AnyStrToFloat(aGetal);
    end;

    vPos := Pos('+', aGetal);
    if (vPos > 0) then
    begin
      aExtraTraining := aExtraTraining + uBibConv.AnyStrToInt(Copy(aGetal, vPos + 1, Length(aGetal)));
    end;
  end;
end;

procedure TfrmHTPaste.CalculatePotential;
begin


  if (not FBezigMetCalculeren) then
  begin
    FBezigMetCalculeren := TRUE;

    try
      if (edKeepen.Value > 8.01) then
      begin
        edKeepen.Value := 8.01;
      end;
      if (edVerdedigen.Value > 8.01) then
      begin
        edVerdedigen.Value := 8.01;
      end;
      if (edPositiespel.Value > 8.01) then
      begin
        edPositiespel.Value := 8.01;
      end;
      if (edVleugelspel.Value > 8.01) then
      begin
        edVleugelspel.Value := 8.01;
      end;
      if (edPassen.Value > 8.01) then
      begin
        edPassen.Value := 8.01;
      end;
      if (edScoren.Value > 8.01) then
      begin
        edScoren.Value := 8.01;
      end;
      if (edSpelhervatten.Value > 8.01) then
      begin
        edSpelhervatten.Value := 8.01;
      end;

      if (cbU20.Checked) then
      begin
        CalculateU20Potential;
      end
      else
      begin
        CalculateNTPotential;
      end;

      CalculateWages(edVerdedigen.Value,edPositiespel.Value,edVleugelspel.Value,
        edPassen.Value,edScoren.Value,edSpelhervatten.Value);
    finally
      FBezigMetCalculeren := FALSE;
    end;
  end;
end;


procedure TfrmHTPaste.ReadIni;
begin
  with TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini')) do
  begin
    try
      cbU20.Checked := ReadInteger('ALGEMEEN','U20', 0) = -1;
    finally
      Free;
    end;
  end;
end;

procedure TfrmHTPaste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteINI;
end;

procedure TfrmHTPaste.WriteIni;
begin
  with TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini')) do
  begin
    try
      WriteInteger('ALGEMEEN','U20', uBibConv.BoolToInt(cbU20.Checked));
    finally
      Free;
    end;
  end;
end;

end.
