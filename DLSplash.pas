unit DLSplash;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TSplashForm = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.DFM}

end.
