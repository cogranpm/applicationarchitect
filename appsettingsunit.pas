unit AppSettingsUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, appinterfacesunit, IniFiles;


type
  TAppSettings = class(TObject)

  private
       FDatabaseType : databaseType;
       FDatabaseName : string;
       FDatabaseHost : string;
       FDatabaseUser : string;
       FDatabasePassword : string;
       FDatabasePort : Integer;
       const
         C_INI_SECTION = 'APP';
  public
       constructor Create();
       procedure ReadSettings();
       procedure WriteSettings();
       property DatabaseType: databaseType read FDatabaseType write FDatabaseType;
       property DatabaseName: string read FDatabaseName write FDatabaseName;
       property DatabaseHost: string read FDatabaseHost write FDatabaseHost;
       property DatabaseUser: string read FDatabaseUser write FDatabaseUser;
       property DatabasePassword: string read FDatabasePassword write FDatabasePassword;
       property DatabasePort: Integer read FDatabasePort write FDatabasePort;
  end;



implementation



constructor TAppSettings.Create();
begin
   inherited Create;
   self.DatabaseName:='';
   self.DatabaseHost:='';
   self.DatabaseUser:='';
   self.DatabasePassword:='';
   self.DatabasePort:=0;

end;

procedure TAppSettings.ReadSettings();
var
   MemFile : TMemIniFile;
   DatabaseTypeRaw : Integer;
begin
    MemFile:=TMemIniFile.Create(GetAppConfigDir(false) + 'App.ini');
    try
       DatabaseTypeRaw:= MemFile.ReadInteger(C_INI_SECTION, 'DatabaseType', 0);
       if DatabaseTypeRaw=Ord(edbFireBirdEmbedded) then
          self.DatabaseType:=edbFireBirdEmbedded
       else if DatabaseTypeRaw=Ord(edbFireBirdServer) then
          self.DatabaseType:=edbFireBirdServer
       else if DatabaseTypeRaw=Ord(edbMySQL) then
          self.DatabaseType:=edbMySQL
       else if DatabaseTypeRaw=Ord(edbMSSQL) then
          self.DatabaseType:=edbMSSQL;
       self.DatabaseHost:= MemFile.ReadString(C_INI_SECTION, 'DatabaseHost', '');
       self.DatabaseName:= MemFile.ReadString(C_INI_SECTION, 'DatabaseName', '');
       self.DatabaseUser:= MemFile.ReadString(C_INI_SECTION, 'DatabaseUser', '');
       self.DatabasePassword:= MemFile.ReadString(C_INI_SECTION, 'DatabasePassword', '');
       self.DatabasePort:=MemFile.ReadInteger(C_INI_SECTION, 'DatabasePort', 0);
    finally
           MemFile.Free;
    end;
end;

procedure TAppSettings.WriteSettings();
   var
      MemFile : TMemIniFile;
   begin
       MemFile:=TMemIniFile.Create(GetAppConfigDir(false) + 'App.ini');
       try

          MemFile.WriteString(C_INI_SECTION, 'DatabaseHost', self.DatabaseHost);
          MemFile.WriteString(C_INI_SECTION, 'DatabaseName', self.DatabaseName);
          MemFile.WriteString(C_INI_SECTION, 'DatabaseUser', self.DatabaseUser);
          MemFile.WriteString(C_INI_SECTION, 'DatabasePassword', self.DatabasePassword);
          MemFile.WriteInteger(C_INI_SECTION, 'DatabasePort', self.DatabasePort);
          MemFile.WriteInteger(C_INI_SECTION, 'DatabaseType', Ord(self.DatabaseType));
       finally
              MemFile.Free;
       end;
end;


end.

