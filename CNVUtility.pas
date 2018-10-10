unit CNVUtility;

interface
uses Forms;

function checkClassExistence(app: TApplication; NameOfClass: String): Boolean;

implementation

//
// Checks to see if the Form or Class has been already been declared.
//

function checkClassExistence(app: TApplication; NameOfClass: String): Boolean;
var
  i: Integer;
begin
   checkClassExistence := False;
   for i := 0 to app.ComponentCount - 1 do
      if ( app.Components[i].ClassName = NameOfClass ) Then
         checkClassExistence := True;
end;


end.
