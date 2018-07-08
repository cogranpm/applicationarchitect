unit unitDatabaseSettings;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, appinterfacesunit,
  AppSettingsUnit, types;

type

  { TfrmDatabaseSettings }

  TfrmDatabaseSettings = class(TForm)
    btnApply: TButton;
    btnCancel: TButton;
    Label4: TLabel;
    Label5: TLabel;
    txtUser: TEdit;
    txtPassword: TEdit;
    grpSecurity: TGroupBox;
    txtHost: TEdit;
    txtName: TEdit;
    txtPort: TEdit;
    GroupBox1: TGroupBox;
    grpServer: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    rbFirebird: TRadioButton;
    rbFirebirdServer: TRadioButton;
    rbMysql: TRadioButton;
    rbMsSql: TRadioButton;
    procedure btnApplyClick(Sender: TObject);
    procedure btnApplyContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure rbFirebirdChange(Sender: TObject);
    procedure rbFirebirdServerChange(Sender: TObject);
    procedure rbMsSqlChange(Sender: TObject);
    procedure rbMysqlChange(Sender: TObject);
  private
    { private declarations }
    FAppSettings : TAppSettings;
  public
    { public declarations }
    constructor Create(AOwner: TComponent; var PAppSettings: TAppSettings);
    property AppSettings : TAppSettings read FAppSettings write FAppSettings;
  private
    procedure OnChangeDatabaseType();
  end;

var
  frmDatabaseSettings: TfrmDatabaseSettings;

implementation

{$R *.lfm}

{ TfrmDatabaseSettings }

constructor TfrmDatabaseSettings.Create(AOwner: TComponent; var PAppSettings: TAppSettings);
begin
  inherited Create(AOwner);
  self.FAppSettings:=PAppSettings;
end;

procedure TfrmDatabaseSettings.OnChangeDatabaseType();
begin
   if self.rbFirebird.Checked then
   begin
      grpServer.Enabled:=False;
      self.txtUser.Text:='SYSDBA';
      self.txtPassword.Text:='masterkey';
   end
   else
   begin
      grpServer.Enabled:=True;
   end;
end;

procedure TfrmDatabaseSettings.btnApplyContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin

end;

procedure TfrmDatabaseSettings.FormCreate(Sender: TObject);
begin
   if AppSettings.DatabaseType = edbFireBirdEmbedded then
      self.rbFirebird.Checked:=True
   else if AppSettings.DatabaseType = edbFireBirdServer then
      self.rbFirebirdServer.Checked:=True
   else if AppSettings.DatabaseType = edbMySQL then
      self.rbMysql.Checked:=True
   else if AppSettings.DatabaseType = edbMSSQL then
      self.rbMsSql.Checked:=True
   else
     self.rbFirebird.Checked:=True;

   if AppSettings.DatabaseHost = '' then
      self.txtHost.Text:='127.0.0.1'
   else
     self.txtHost.Text:=AppSettings.DatabaseHost;

   self.txtName.Text:=AppSettings.DatabaseName;
   self.txtUser.Text:=AppSettings.DatabaseUser;
   self.txtPassword.Text:=AppSettings.DatabasePassword;
   self.txtPort.Text:=IntToStr(AppSettings.DatabasePort);

   if self.rbFirebird.Checked then
   begin
      grpServer.Enabled:=False;
      if self.txtUser.Text='' then
         begin
           self.txtUser.Text:='SYSDBA';
           self.txtPassword.Text:='masterkey';
         end;
   end
   else
      grpServer.Enabled:=True;

end;

procedure TfrmDatabaseSettings.Label1Click(Sender: TObject);
begin

end;

procedure TfrmDatabaseSettings.rbFirebirdChange(Sender: TObject);
begin
     OnChangeDatabaseType();
end;

procedure TfrmDatabaseSettings.rbFirebirdServerChange(Sender: TObject);
begin
     OnChangeDatabaseType();
end;

procedure TfrmDatabaseSettings.rbMsSqlChange(Sender: TObject);
begin
  OnChangeDatabaseType();
end;

procedure TfrmDatabaseSettings.rbMysqlChange(Sender: TObject);
begin
  OnChangeDatabaseType();
end;

procedure TfrmDatabaseSettings.btnApplyClick(Sender: TObject);
begin
   if rbFirebird.Checked then
      FAppSettings.DatabaseType:=edbFireBirdEmbedded
   else if rbFirebirdServer.Checked then
      FAppSettings.DatabaseType:=edbFireBirdServer
   else if rbMysql.Checked then
      FAppSettings.DatabaseType:=edbMySQL
   else if rbMsSql.Checked then
      FAppSettings.DatabaseType:=edbMSSQL;

   if FAppSettings.DatabaseType = edbFireBirdEmbedded then
      begin
         FAppSettings.DatabaseName:=GetAppConfigDir(false) + 'Default.fdb';
         FAppSettings.DatabaseHost:='';
      end;

   if (FAppSettings.DatabaseType = edbMySQL) or (FAppSettings.DatabaseType = edbMSSQL) or (FAppSettings.DatabaseType = edbFireBirdServer) then
      begin
        FAppSettings.DatabaseHost:=self.txtHost.Text;
        FAppSettings.DatabaseName:=self.txtName.Text;
        if self.txtPort.Text <> '' then
           FAppSettings.DatabasePort:= StrToInt(self.txtPort.Text);
      end;

   FAppSettings.DatabaseUser:=self.txtUser.Text;
   FAppSettings.DatabasePassword:=self.txtPassword.Text;
  ModalResult:=mrOK;
end;

end.

