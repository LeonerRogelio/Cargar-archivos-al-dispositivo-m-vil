unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.ListBox;

type
  TfrmMain = class(TForm)
    pnlHeader: TPanel;
    imgFile: TImage;
    btnOpenImage: TButton;
    btnClose: TButton;
    ComboBox1: TComboBox;
    tLruta: TLabel;
    tLnombre: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnOpenImageClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  imageName: string;
  imagePath: string;

implementation

{$R *.fmx}

// para la clase TPath
uses System.IOUtils;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.btnOpenImageClick(Sender: TObject);
begin
  // Este método carga la imagen en el componente TImage
  if ComboBox1.ItemIndex = 0 then
  begin
    imageName := ComboBox1.Selected.Text;
    imgFile.Bitmap.LoadFromFile(imagePath + PathDelim + (imageName+ '.jpg'));
    tLnombre.Text := 'Nombre:';
    tLruta.Text := 'Ubicación:';
    ShowMessage('Seleccione una Imagen');
  end
  else
  begin
    imageName := ComboBox1.Selected.Text;
    imgFile.Bitmap.LoadFromFile(imagePath + PathDelim + imageName);
    tLnombre.Text := 'Nombre: ' + imageName;
    tLruta.Text := 'Ubicación: ' + imagePath;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
{$IF DEFINED(MSWINDOWS)}
  imagePath := './';
{$ELSEIF DEFINED(ANDROID)}
  imagePath := TPath.GetHomePath;
{$ENDIF}
end;

end.
