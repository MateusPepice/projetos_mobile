unit uCliente;
interface
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.Objects;
type
  TCliente = record
    nome, sobrenome, cidade, sexo: string;
    codigo, idade : Integer;
    salario : Float32;
    ativo : Boolean;
  end;


  TZ = class(TForm)
    Label1: TLabel;
    edt_codigo: TEdit;
    Label2: TLabel;
    edt_nome: TEdit;
    Label3: TLabel;
    edt_idade: TEdit;
    Label4: TLabel;
    edt_salario: TEdit;
    Label5: TLabel;
    edt_cidade: TEdit;
    Label8: TLabel;
    edt_sobrenome: TEdit;
    cbSexo: TComboBox;
    Label6: TLabel;
    cbAtivo: TCheckBox;
    btn_gravar: TButton;
    Z: TButton;
    btn_carteira: TButton;
    btn_faixa_etaria: TButton;
    btn_verificar_cidade: TButton;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    bt_imprimir: TButton;
    Button3: TButton;
    procedure btn_gravarClick(Sender: TObject);
    procedure validar_campos();
    procedure ZClick(Sender: TObject);
    procedure btn_carteiraClick(Sender: TObject);
    procedure btn_faixa_etariaClick(Sender: TObject);
    procedure btn_verificar_cidadeClick(Sender: TObject);
    procedure insere_cliente_lista(cliente :TCliente);
    procedure bt_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Z: TZ;
  aCliente : Array[0..10] of TCliente;

implementation
{$R *.fmx}
procedure TZ.btn_carteiraClick(Sender: TObject);
begin

  if StrToInt(edt_idade.Text) >= 18 then
    ShowMessage('Pode tirar a carteira de motorista!')
  else
    ShowMessage('Não pode tirar a carteira de motorista.');

end;

procedure TZ.btn_faixa_etariaClick(Sender: TObject);
begin

  case StrToInt(edt_idade.Text) of
    0..17 : ShowMessage('Menor de idade');
    18..30: ShowMessage('Adulto');
    31..50: ShowMessage('Velho');
    51..100: ShowMessage('Idoso');
    else
      ShowMessage('Pré Histórico');
  end;

end;

procedure TZ.btn_gravarClick(Sender: TObject);
var
  vCliente : TCliente;
begin

  validar_campos;

  vCliente.codigo := StrToInt(edt_codigo.Text);
  vCliente.nome := edt_nome.Text;
  vCliente.sobrenome := edt_sobrenome.Text;
  vCliente.idade := StrToInt(edt_idade.Text);
  vCliente.salario := StrToFloat(edt_salario.Text);
  vCliente.ativo := cbAtivo.IsChecked;
  vCliente.cidade := edt_cidade.Text;
  if cbSexo.ItemIndex = 0 then
    vCliente.sexo := 'Masculino'
  else
    vCliente.sexo := 'Feminino';

  insere_cliente_lista(vCliente);

  ShowMessage('Cliente cadastrado com sucesso!');
end;

procedure TZ.ZClick(Sender: TObject);
begin

  Memo1.Lines.Clear;
  edt_codigo.Text := '';
  edt_nome.Text := '';
  edt_sobrenome.Text := '';
  edt_idade.Text := '';
  edt_salario.Text := '';
  edt_cidade.Text := '';

end;

procedure TZ.btn_verificar_cidadeClick(Sender: TObject);
begin

  if UpperCase(edt_cidade.Text) = 'CASCAVEL' then
    ShowMessage('É de Cascavel')
  else
    ShowMessage('Não é de Cascavel');

end;

procedure TZ.bt_imprimirClick(Sender: TObject);
var
  I: Integer;
begin

  for I := 0 to 10 do
  begin
    if aCliente[I].codigo <> 0then
    begin
      Memo1.Lines.Add('Cliente cód.: '+IntToStr(aCliente[I].codigo));
      Memo1.Lines.Add('Cliente nome: ' + aCliente[I].nome+' '+aCliente[I].sobrenome);
      Memo1.Lines.Add('Idade: ' + IntToStr(aCliente[I].idade));
      Memo1.Lines.Add('Salário ' + FloatToStr(aCliente[I].salario));
      Memo1.Lines.Add('Cidade: ' + aCliente[I].cidade);
      Memo1.Lines.Add('Ativo: '+aCliente[I].ativo.ToString());
      Memo1.Lines.Add('==============================');
    end;

  end;

end;

procedure TZ.insere_cliente_lista(cliente :TCliente);
var
  I: Integer;
begin

  for I := 0 to 10 do
  begin
    if aCliente[I].codigo = 0 then
    begin
      aCliente[I] := cliente;
      break;
    end;

  end;

end;

procedure TZ.validar_campos;
begin

 if edt_codigo.Text = '' then
  begin
    ShowMessage('Campo código é obrigatório!');
    edt_codigo.SetFocus;
    abort;
  end;

  if edt_nome.Text = ''  then
    begin
      ShowMessage('Campo nome é obrigatório');
      edt_nome.SetFocus;
      abort;
    end;

  if edt_sobrenome.Text = ''  then
    begin
      ShowMessage('Campo sobrenome é obrigatório');
      edt_sobrenome.SetFocus;
      abort;
    end;

  if edt_salario.Text = ''  then
    begin
      ShowMessage('Campo salário é obrigatório');
      edt_salario.SetFocus;
      abort;
    end;

  if edt_cidade.Text = ''  then
    begin
      ShowMessage('Campo cidade é obrigatório');
      edt_cidade.SetFocus;
      abort;
    end;

  end;

end.
