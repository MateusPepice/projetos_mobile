program pPrincipal;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPrincipal in 'uPrincipal.pas' {frm_caption},
  uClientes in 'uClientes.pas' {frm_clientes};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_caption, frm_caption);
  Application.CreateForm(Tfrm_clientes, frm_clientes);
  Application.Run;
end.
