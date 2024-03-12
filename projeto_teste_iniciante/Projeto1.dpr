program Projeto1;

uses
  System.StartUpCopy,
  FMX.Forms,
  uCliente in 'uCliente.pas' {Z};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TZ, Z);
  Application.Run;
end.
