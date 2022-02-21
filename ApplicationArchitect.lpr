program ApplicationArchitect;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, sysutils, PascalScriptFCL, pascalscript, FrmMainUnit, mainmoduleunit,
  appinterfacesunit, firebirdDataModule, FirebirdDataProvider, AppSettingsUnit,
  NavigationNodeUnit, FirebirdQueryModule, MySQLDataModule, MySQLQueryModule,
  MySQLDataProvider, SynMustache, SynCommons, SynLZ, BuildControllerLoadUnit,
  BuildEntityDTOUnit, MySqlBuildQueryModule, FirebirdBuildQueryModule,
  frmModels, mysqllookupsquery, firebirdlookupsquery, AssociationTree,
  ScreenFamilyViewModel, unitFrmPropertyType, unitfrmListHeader,
  unitFrmPropertyGroup, unitFrmMasterCategory, frmMasterProperty, frmScripting,
  BuildHelper, jsonObjectWrapper, BuildLookup,
  MasterPropertyHelper, SettingsDBModule, dmMySQLImport, MYSQLImportProvider,
  frmModelImporter, mysqlimportquery, FirebirdImportQuery, fraMappings;

{$R *.res}

var
  MainModuleInst : TMainModule;

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  MainModuleInst:=TMainModule.Create();
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.Controller:=MainModuleInst;
  MainModuleInst.Init(frmMain);
  //Application.CreateForm(TMYSQLImportQuery, MYSQLImportQuery);
  //Application.CreateForm(TFirebirdImportQuery, FirebirdImportQuery);
  //Application.CreateForm(TfrmModelImporter, frmModelImporter);
 // Application.CreateForm(TSettingsDB, SettingsDB);
  //Application.CreateForm(TfrmBuildLookup, frmBuildLookup);
  //Application.CreateForm(TMySqlLookups, MySqlLookups);
  //Application.CreateForm(TFirebirdLookups, FirebirdLookups);
  Application.Run;
  {
  if Assigned(MainModuleInst)then
     FreeAndNil(MainModuleInst);
  }
end.

