object frmReleaseNotes: TfrmReleaseNotes
  Left = 285
  Top = 263
  BorderStyle = bsSingle
  Caption = 'Release Notes'
  ClientHeight = 302
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 475
    Height = 302
    Align = alClient
    TabOrder = 0
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 473
      Height = 300
      Align = alClient
      Lines.Strings = (
        'Release 0.99.4 '
        '----------------------'
        'The following items were added in release 0.99.4:'
        
          '1). During search in the Check In/Out Module a "Serach Message" ' +
          'is displayed'
        
          'and if there are no records found a "No records found" message i' +
          's shown.'
        
          '2). Created index PrjBldPlTDrTSearch on Project Number, Building' +
          ' ID, Plan Type Id '
        'and Drawing Type to speed up search on Check In/Out'
        '3). Changed Navigator buttons to text based for all the forms.'
        ''
        'Release 0.99.5'
        '----------------------'
        '1). Added Toolbars on all forms.'
        '2). Changed "Hospital" word to "Facility" on all screens'
        '3). Added Status Fields in Check In/Out Screen'
        '4). Added Image Viewing capability in Check In/Out screen'
        
          '5). Made Issues For field required in DrawingDetail with default' +
          ' value "N/A"'
        '6). Corrected Error in Print from within Check In/Out'
        ''
        'Release 0.99.7'
        '-----------------------'
        
          '1). removed the text buttons and replaced them with Navigation b' +
          'ars.'
        ''
        'Release 0.99.8'
        '----------------------'
        '1). Improved speed by creating wndows only on demand vs. startup'
        '2). Added RCR Logo'
        '3). Corrected Bug in Drawing Maintenance'
        '4). Corrected bug in scrolling in About Box Release Notes'
        ''
        'Release 0.99.9'
        '----------------------'
        '1) Sorting of SheetNumbers under the Draing Detail View.'
        '2). Disabled Image Viewing'
        '3). Corrected navigation buttons in User Maintenance Screen'
        '4). Added Hospital field in User Maintenance Screen'
        '5). Added Drawing viewing by Hospital Id '
        '6). Added SheetNumberIdx index'
        '7). Added HospitalID field in Person table'
        '8). Deleted index SheetNumber from DrawingDetail'
        
          '9). Changed index ProjectNumber of DrawingDetail to be ProjectNu' +
          'mber + SheetNumber'
        
          '10). Fix "Access Violation" error when trying to print from Chec' +
          'k In/Out'
        ''
        'Release 1.00.0'
        '------------------------'
        
          '1). Added in Report on Check In/Out the following: File Cabinet,' +
          ' Drawer, Sheet Title'
        '2). Removed from Report in Chech In/Out Issued For'
        '3). Added "(Yes/No)" in user maintenance screen'
        '4). Viewing message includes " ... or CAD "'
        ''
        'Release 1.00.4'
        '------------------------'
        '1). Converted to an MS-Access Database'
        '2). Optimized performance of the database'
        '3). removed 3rd party LMD controls'
        ''
        'Release 1.00.5'
        '------------------------'
        '1). Fixed error with adding records in DrawingMaster'
        
          '2). Fixed error with "Non-Blob column..." by resequencing the fi' +
          'elds in Hospital'
        ''
        'Release 1.00.6'
        '------------------------'
        
          '1). Replaced Navigator Bar with series of custom buttons to fix ' +
          'problem with "Delete/record Key Error"'
        ''
        'Release 1.00.7'
        '------------------------'
        '1). Fixed issue with "Key error"'
        ''
        'Release 1.00.8'
        '------------------------'
        '1). Added report "Projects by Designer"')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
end
