unit nala.Messages;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Controls, ComCtrls,
  nala.MessageList;

type

  { TNalaMessages }

  TNalaMessages = class(TObject)
  private
    FPageControl: TPageControl;
    FDebugTab, FMessageTab: TTabSheet;
    FDebug, FMessages: TMessageList;
  public
    property Debug: TMessageList read FDebug;
    property Messages: TMessageList read FMessages;

    procedure ShowMessages;
    procedure Hide;
    procedure Show;

    constructor Create(AParent: TWinControl);
    destructor Destroy; override;
  end;

implementation

uses
  nala.MainForm;

{ TNalaMessages }

procedure TNalaMessages.ShowMessages;
begin
  FPageControl.ActivePage := FMessageTab;
end;

procedure TNalaMessages.Hide;
begin
  FPageControl.Hide;
end;

procedure TNalaMessages.Show;
begin
  FPageControl.Show;
end;

constructor TNalaMessages.Create(AParent: TWinControl);
begin
  inherited Create;

  FPageControl := TPageControl.Create(nil);
  FPageControl.Parent := AParent;
  FPageControl.Align := alClient;
  FPageControl.Images := NalaForm.Images16x16;

  FMessageTab := FPageControl.AddTabSheet;
  FMessageTab.Caption := 'Message';
  FMessageTab.ImageIndex := 11;

  FMessages := TMessageList.Create(FMessageTab);
  FMessages.Images := NalaForm.Images12x12;

  FDebugTab := FPageControl.AddTabSheet;
  FDebugTab.Caption := 'Debug';
  FDebugTab.ImageIndex := 10;

  FDebug := TMessageList.Create(FDebugTab);
  FDebug.Images := NalaForm.Images12x12;
end;

destructor TNalaMessages.Destroy;
begin
  FPageControl.Free;

  inherited Destroy;
end;

end.

