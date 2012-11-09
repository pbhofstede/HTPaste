program HTPaste;

uses
  Forms,
  formHTPaste in 'formHTPaste.pas' {frmHTPaste},
  uHTTraining in 'uHTTraining.pas',
  uHattrick in 'uHattrick.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'JOINT U17 HT-paste';
  Application.CreateForm(TfrmHTPaste, frmHTPaste);
  Application.Run;
end.
