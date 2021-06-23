<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    UsersMatch
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$UsersMatchForm                  = New-Object system.Windows.Forms.Form
$UsersMatchForm.ClientSize       = New-Object System.Drawing.Point(800,600)
$UsersMatchForm.text             = "Users Match To The Groups"
$UsersMatchForm.TopMost          = $false

$UsersMatchLabel                 = New-Object system.Windows.Forms.Label
$UsersMatchLabel.text            = "Users file (csv):"
$UsersMatchLabel.AutoSize        = $true
$UsersMatchLabel.width           = 25
$UsersMatchLabel.height          = 10
$UsersMatchLabel.location        = New-Object System.Drawing.Point(9,27)
$UsersMatchLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$UsersFileTextBox                = New-Object system.Windows.Forms.TextBox
$UsersFileTextBox.multiline      = $false
$UsersFileTextBox.width          = 635
$UsersFileTextBox.height         = 20
$UsersFileTextBox.Anchor         = 'top,right,left'
$UsersFileTextBox.location       = New-Object System.Drawing.Point(112,23)
$UsersFileTextBox.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$UsersFileButton                 = New-Object system.Windows.Forms.Button
$UsersFileButton.text            = "..."
$UsersFileButton.width           = 30
$UsersFileButton.height          = 30
$UsersFileButton.Anchor          = 'top,right'
$UsersFileButton.location        = New-Object System.Drawing.Point(761,19)
$UsersFileButton.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Result                          = New-Object system.Windows.Forms.DataGridView
$Result.width                    = 781
$Result.height                   = 522
$Result.Anchor                   = 'top,right,bottom,left'
$Result.location                 = New-Object System.Drawing.Point(9,71)

$UsersMatchForm.controls.AddRange(@($UsersMatchLabel,$UsersFileTextBox,$UsersFileButton,$Result))

$UsersFileButton.Add_Click({ ChooseUsersCsvFile })
$UsersFileTextBox.Add_TextChanged({ InputFileIsChanged })

function ChooseUsersCsvFile {
    $FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
        InitialDirectory = '.'
        Filter = 'Csv files (*.csv)|*.csv'
    }
    $null = $FileBrowser.ShowDialog()
    $UsersFileTextBox.Text = $FileBrowser.FileName
}

function InputFileIsChanged {
    $UsersFileName = $UsersFileTextBox.Text

    # Construct a new empty datatable 
    #$dt = New-Object DataTable ("Employee");
    # Define the table columns. For example:
    #dt.Columns.Add("id", typeof(int));
    #dt.Columns.Add("name", typeof(string));
    #dt.Columns.Add("salary", typeof(decimal));
    #dt.Columns.Add("dateHired", typeof(DateTime));

    # Add rows 
    #dt.Rows.Add(1, "Tim Smith", 3500.20, new DateTime(2009, 1, 15));
    #dt.Rows.Add(2, "Ann Jones", 2700, new DateTime(2010,7,28));
    #dt.Rows.Add(3, "Tom Chong", 2900, DateTime.Now);       

    #$Result.DataSource 
}


#Write your logic code here

[void]$UsersMatchForm.ShowDialog()