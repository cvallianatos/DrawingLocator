unit DLFrameData;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, DBCtrls;

type
  TfData = class(TFrame)
    DBNavigator: TDBNavigator;
    DBGrid: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses DLDrawingLocData;

{$R *.DFM}

end.
