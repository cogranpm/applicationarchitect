unit FrmMainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  ExtCtrls, ComCtrls, Menus, ActnList, appinterfacesunit, db, sqldb, NavigationNodeUnit;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    actionImportModel: TAction;
    actionDeleteModel: TAction;
    actionNewModel: TAction;
    actionDelete: TAction;
    actionNew: TAction;
    actionSetDatabase: TAction;
    actionSave: TAction;
    actionQuit: TAction;
    mainImages: TImageList;
    mainActions: TActionList;
    MenuItem1: TMenuItem;
    mnuModelDelete: TMenuItem;
    mnuModelNew: TMenuItem;
    mnuModel: TMenuItem;
    mnuFileQuit: TMenuItem;
    mnuFileSave: TMenuItem;
    mnuFileSetDatabase: TMenuItem;
    mnuFile: TMenuItem;
    mnuNavDeleteModel: TMenuItem;
    mnuNavNewModel: TMenuItem;
    mnuMain: TMainMenu;
    pnlMain: TPanel;
    pnlLeft: TPanel;
    pnlTop: TPanel;
    navigationTree: TTreeView;
    mnuNavPopup: TPopupMenu;
    spltMain: TSplitter;
    tbMain: TToolBar;
    tbNewModel: TToolButton;
    procedure actionDeleteExecute(Sender: TObject);
    procedure actionDeleteModelExecute(Sender: TObject);
    procedure actionImportModelExecute(Sender: TObject);
    procedure actionNewExecute(Sender: TObject);
    procedure actionNewModelExecute(Sender: TObject);
    procedure actionQuitExecute(Sender: TObject);
    procedure actionSaveExecute(Sender: TObject);
    procedure actionSetDatabaseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure mnuNavPopupPopup(Sender: TObject);
    procedure navigationTreeChange(Sender: TObject; Node: TTreeNode);
    procedure navigationTreeEditingEnd(Sender: TObject; Node: TTreeNode;
      Cancel: Boolean);

  private
    { private declarations }
    FController : IMainModule;
  public
    { public declarations }
    constructor Create();
    destructor Destroy(); override;
    property Controller : IMainModule read FController write FController;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

constructor TfrmMain.Create();
begin
    inherited;
end;

destructor TfrmMain.Destroy();
begin

    inherited;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin

end;

procedure TfrmMain.mnuNavPopupPopup(Sender: TObject);
var
  NodeData: TNavigationNode;
begin
  { determine here what should be enabled etc }
  if not Assigned(self.navigationTree.Selected) then
  begin
    self.mnuNavPopup.Items[1].Enabled:=False;
  end
  else
  begin
       NodeData:=TNavigationNode(self.navigationTree.Selected.Data);
       if NodeData.FType = navigationNodeType.ModelEntity then
       begin
         self.mnuNavPopup.Items[1].Enabled:=True;
       end
       else
       begin
         self.mnuNavPopup.Items[1].Enabled:=False;
       end;
  end;

end;

procedure TfrmMain.navigationTreeChange(Sender: TObject; Node: TTreeNode);
begin
  self.Controller.OnSelectModel(Node);
end;

procedure TfrmMain.navigationTreeEditingEnd(Sender: TObject; Node: TTreeNode;
  Cancel: Boolean);
var
  NodeData : TNavigationNode;
  modelsData : TSQLQuery;
begin

  if not Assigned(Node.Data) then
     exit;

  NodeData:= TNavigationNode(Node.Data);
  if not Assigned(NodeData) then
     exit;

  if NodeData.FType = navigationNodeType.NewModelEntity then
  begin
       Controller.OnPostModel(Node.Text);
  end;
end;



procedure TfrmMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     Controller.OnQuit();
end;

procedure TfrmMain.actionQuitExecute(Sender: TObject);
begin
   Controller.OnQuit();
end;

procedure TfrmMain.actionDeleteExecute(Sender: TObject);
begin
     Controller.OnDelete();
end;

procedure TfrmMain.actionDeleteModelExecute(Sender: TObject);
begin
     Controller.OnDeleteModel();
end;

procedure TfrmMain.actionImportModelExecute(Sender: TObject);
begin
    Controller.OnImportModel();
end;

procedure TfrmMain.actionNewExecute(Sender: TObject);
begin
     Controller.OnNew();
end;

procedure TfrmMain.actionNewModelExecute(Sender: TObject);
begin
     Controller.OnNewModel();
end;

procedure TfrmMain.actionSaveExecute(Sender: TObject);
begin
     Controller.OnSave();
end;

procedure TfrmMain.actionSetDatabaseExecute(Sender: TObject);
begin
     Controller.OnSetDatabase();
end;


end.

