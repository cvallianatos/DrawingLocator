object frmHelp: TfrmHelp
  Left = 335
  Top = 177
  Width = 602
  Height = 423
  Caption = 'Help'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 344
    Width = 594
    Height = 52
    Align = alBottom
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 496
      Top = 8
      Width = 75
      Height = 33
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkClose
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 344
    Align = alClient
    TabOrder = 1
    object RichEdit1: TRichEdit
      Left = 1
      Top = 1
      Width = 592
      Height = 342
      Align = alClient
      Lines.Strings = (
        'DRAWINGS:'
        ''
        
          'The "Drawings" menu is also utilized to add new drawings to the ' +
          'database and also modify '
        
          'existing records.  The user must have administrative rights to b' +
          'e able to add or modify database.'
        ''
        
          'The viewing of the project number, Designer & Facility to show a' +
          ' general list of all projects that '
        
          'are available. To search for documents the check in/ checkout se' +
          'ction of the program should be '
        'utilized. '
        ''
        'Search'
        
          'To search for documents within the database refer to the followi' +
          'ng CHECK IN/CHECK out '
        'procedures'
        ''
        'CHECK IN/CHECKOUT:'
        ''
        'Searching for documents'
        ''
        
          'The search windows under the CHECK IN/CHECK OUT menus are option' +
          'al.  The search engine '
        
          'will search the database for only the window or the combination ' +
          'of windows selected. Utilize the '
        
          'pull down menu from the search windows to select the desired fie' +
          'ld.  The following search '
        'windows are available.'
        ''
        'Facility or Building:'
        'To display documents related to a specific facility.'
        '�'#9'Select the Facility from the Facility pull down menu '
        '�'#9'Select the search button to display the desired information'
        ''
        'Project Number'
        
          'To display documents related to a specific project number (Proje' +
          'ct number is the designers '
        'project number)'
        
          '�'#9'Select the project number from the pull down menu or type in t' +
          'he project number in the '
        'project number window.'
        '�'#9'Select the search button to display the desired information'
        ''
        'Facility Project Number'
        
          'To display documents related to a specific facility project numb' +
          'er.'
        
          '�'#9'Select the project number from the pull down menu or type in t' +
          'he project number in the '
        'project number window.'
        '�'#9'Select the search button to display the desired information'
        ''
        'Plan Type'
        ''
        
          'To select a specific discipline (ex. Architectural, Electrical, ' +
          'Mechanical, etc) this option should be '
        'selected.'
        
          '�'#9'Select the discipline desired from the plan type pull down men' +
          'u '
        '�'#9'Select the search button to display the desired information'
        ''
        'Drawing Type:'
        ''
        
          'To search for documents for specific floor or specific document ' +
          '(ex. Riser diagrams, Details '
        'Schedules, etc.'
        
          '�'#9'Select the specific document type from the drawing type pull d' +
          'own menu '
        '�'#9'Select the search button to display the desired information'
        ''
        'To check out Drawings:'
        ''
        
          'Locate the drawings or drawings desired by using the search feat' +
          'ures.'
        ''
        
          'The user must first select the Company & Recipient boxes (The co' +
          'mpany and recipient '
        
          'information must already exist in the database.  (Contact your f' +
          'acility drawing administrator to '
        'add new company or recipients).'
        ''
        
          '"Select All" button for all the drawings listed or select the dr' +
          'awings that you wish to checkout by '
        
          'holding down the Ctrl key button and selecting the desired drawi' +
          'ngs with the left mouse button.'
        ''
        
          'The displayed list of information will indicate whether or not t' +
          'he drawings are already checked '
        
          'out to someone else. If so, it will indicate to whom & will appe' +
          'ar in red color. '
        ''
        
          'Select the check out button to log out the listed drawings in th' +
          'e recipient name. (Please note that '
        
          'the system will not check out any documents if they were previou' +
          'sly check out by another '
        
          'recipient. The drawings check out previously will be displayed i' +
          'n red color).'
        ''
        'The database table will indicate where the drawings are stored.'
        ''
        
          'We recommend a print out for the recipient so that the documents' +
          ' could be returned to the exact '
        'storage place when returned.'
        ''
        'To check in Drawings:'
        ''
        
          'When the user is done with these drawings, the drawings need to ' +
          'be reselected, to choose the '
        
          'check in button, to remove the recipient'#39's name from the databas' +
          'e.  It is imperative that the '
        
          'drawings are then returned and stored in their original location' +
          '. '
        ''
        
          'Follow the procedure in check out and select the drawings you wh' +
          'ich to check in'
        ''
        'View'
        ''
        
          'The view portion of this program is optional and can be purchase' +
          'd separately.  '
        ''
        
          'The view option could be implemented separately by scanning the ' +
          'documents or linking '
        'documents to an actual CAD file.'
        ''
        
          'The view option will allow the user to view the documents on the' +
          ' screen. The user will be able to '
        
          'move in the document by using the zoom in/out, pan and window co' +
          'mmands. The drawing could '
        'also be printed to a local printer or a plotter.'
        ''
        
          'The view program is capable of viewing AutoCad (DWG), Microstati' +
          'on (DGN), and variety of '
        'image files (TIF, JEPG, etc.).'
        ''
        'REPORT'
        ''
        
          'Generate the report by using the check in /check out menu.  Use ' +
          'search features to narrow '
        
          'down the information in the database.  Select print button in th' +
          'e check in and '
        
          'check out menu.  Select the printer from the print menu (refer t' +
          'o windows operating system for '
        'more information) and print.'
        ''
        ''
        'REPORT:'
        ''
        
          'This will print out a list of all the drawings that are checked ' +
          'out. It will show which drawings are '
        'checked out to whom. '
        'View options:'
        '�'#9'Zoom to fit'
        '�'#9'100%'
        '�'#9'Zoom to width'
        ''
        
          'The arrows in the tool bar are used to navigate through the enti' +
          're report quickly.'
        ''
        'To print report: Select the printer key.'
        'To save report: Select the diskette key.'
        
          'To load existing report: Select open folder key to search the ne' +
          'twork drive.'
        'To close this menu: Select the close key.'
        ''
        'TOOLS:'
        ''
        
          'This pull down menu is used for password maintenance. If the use' +
          'r desires to change their '
        
          'password, type in old password, new password and a confirmation ' +
          'of new password.'
        'Click OK or Cancel.'
        ''
        'ADMINISTRATION:'
        ''
        
          'This Area of the program requires administration rights and woul' +
          'd not be visible to the other '
        'users.'
        ''
        'User Maintenance: '
        ''
        
          'User maintenance is utilized to add, delete or modify users or u' +
          'ser access rights.  '
        ''
        
          'The user must have administrative rights to be able to add or mo' +
          'dify users.'
        ''
        ''
        'Data Maintenance:'
        
          'The user must have administrative rights to be able to add or mo' +
          'dify this area of the database.'
        ''
        
          'Companies/ Recipients: All user information (Name, numbers, comp' +
          'any information, etc) are '
        
          'maintained in this area of the program. The system administrator' +
          ' could add or modify users.'
        ''
        
          'Drawing Types: indicates the type of this is a list of all the d' +
          'rawing types and or disciplines. (Ex. '
        
          'Architectural, Mechanical, Electrical, etc.).  The system admini' +
          'strator could add additional fields'
        ''
        
          'File Cabinets Locations: A table of all the various locations wh' +
          'ere the drawings are stored are '
        'kept in this area.'
        'The system administrator could add or modify fields'
        ''
        
          'Facilities / Buildings: A list of each of the facilities or buil' +
          'dings that are listed in the database. The '
        'system administrator could add additional fields'
        ''
        
          'Plan Types: This is a list of all the document plan types availa' +
          'ble and or identified. (Ex. Floor '
        'plans, Schedules, Details, etc.).'
        ''
        ''
        ''
        ''
        ''
        ''
        '')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
end
