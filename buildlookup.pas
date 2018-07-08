unit BuildLookup;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DbCtrls, ExtCtrls, appinterfacesunit, BuildControllerLoadUnit;

type

  { TfrmBuildLookup }

  TfrmBuildLookup = class(TForm)
    btnRunBuild: TButton;
    btnClose: TButton;
    cboSelectModel: TComboBox;
    cboSelectBuild: TComboBox;
    Label1: TLabel;
    lblSelectBuild: TLabel;
    txtLog: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnRunBuildClick(Sender: TObject);
    procedure cboSelectBuildSelect(Sender: TObject);
    procedure cboSelectModelSelect(Sender: TObject);
  private
    { private declarations }
    FDataProvider: IDataProvider;
    FBuildControllerLoadOption:RBuildControllerLoadOption;
    FSelectedBuildKey:LongInt;
  private
    procedure LoadBuilds(ModelId:LongInt);
    procedure LoadModels();
  public
    { public declarations }
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy(); override;
    procedure Init(PDataProvider:IDataProvider;PBuildControllerLoadOption:RBuildControllerLoadOption);

  end;

var
  frmBuildLookup: TfrmBuildLookup;

implementation

constructor TfrmBuildLookup.Create(TheOwner: TComponent);
begin
    inherited;
end;

destructor TfrmBuildLookup.Destroy();
begin
    if Assigned(FDataProvider) then
       FreeAndNil(FDataProvider);
     inherited;
end;

procedure TfrmBuildLookup.btnRunBuildClick(Sender: TObject);
var
  BuildLoader:TBuildControllerLoader;

begin
     BuildLoader:=TBuildControllerLoader.Create();
     BuildLoader.LogControl:=self.txtLog;
     BuildLoader.Execute(self.FDataProvider, FSelectedBuildKey, FBuildControllerLoadOption);
end;

procedure TfrmBuildLookup.btnCloseClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmBuildLookup.cboSelectBuildSelect(Sender: TObject);
var
  SelectedIndex:Integer;
  ListObject:TLongIntLookup;
begin
     SelectedIndex:=cboSelectBuild.ItemIndex;
     if SelectedIndex >= 0 then
     begin
       if cboSelectBuild.Items.Objects[SelectedIndex] <> Nil then
          begin
               ListObject:=TLongIntLookup(cboSelectBuild.Items.Objects[SelectedIndex]);
               if ListObject <> Nil then
               begin
                    FSelectedBuildKey:=ListObject.Key;
                    self.btnRunBuild.Enabled:=True;
               end;

          end;
     end;
end;

procedure TfrmBuildLookup.cboSelectModelSelect(Sender: TObject);
var
  SelectedIndex:Integer;
  SelectedModelKey:TLongIntLookup;
begin
     SelectedIndex:=cboSelectModel.ItemIndex;
     if SelectedIndex >= 0 then
     begin
       if cboSelectModel.Items.Objects[SelectedIndex] <> Nil then
          begin
               SelectedModelKey:=TLongIntLookup(cboSelectModel.Items.Objects[SelectedIndex]);
               LoadBuilds(SelectedModelKey.Key);
          end;
     end;

end;



procedure TfrmBuildLookup.Init(PDataProvider:IDataProvider; PBuildControllerLoadOption:RBuildControllerLoadOption);

begin
    FDataProvider:=PDataProvider;
    FBuildControllerLoadOption:=PBuildControllerLoadOption;
    LoadModels();
end;

procedure TfrmBuildLookup.LoadBuilds(ModelId:LongInt);
var
  LookupData:TLongIntLookup;
begin
    self.cboSelectBuild.Clear;
    FDataProvider.GetBuildByModelLookup().Active:=False;
    FDataProvider.GetBuildByModelLookup().ParamByName('ModelID').AsLargeInt:=ModelId;
    FDataProvider.GetBuildByModelLookup().Active:=True;
    if FDataProvider.GetBuildByModelLookup().EOF then
       exit;
    FDataProvider.GetBuildByModelLookup().First;
    cboSelectBuild.Enabled:=True;
    lblSelectBuild.Enabled:=True;
    while not FDataProvider.GetBuildByModelLookup().EOF do
    begin
      LookupData:=TLongIntLookup.Create(FDataProvider.GetBuildByModelLookup().FieldByName('BuildId').AsLargeInt, FDataProvider.GetBuildByModelLookup().FieldByName('Name').AsString);
      self.cboSelectBuild.AddItem(LookupData.Display, LookupData);
      FDataProvider.GetBuildByModelLookup().Next;
    end;
end;

procedure TfrmBuildLookup.LoadModels();
var
  LookupData:TLongIntLookup;
begin
    self.cboSelectModel.Clear;
    FDataProvider.GetModellookup().Active:=True;
    FDataProvider.GetModellookup().First;
    while not FDataProvider.GetModellookup().EOF do
    begin
      LookupData:=TLongIntLookup.Create(FDataProvider.GetModellookup().FieldByName('ModelId').AsLargeInt, FDataProvider.GetModellookup().FieldByName('Name').AsString);
      self.cboSelectModel.AddItem(LookupData.Display, LookupData);
      FDataProvider.GetModellookup().Next;
    end;
end;

{$R *.lfm}

end.

