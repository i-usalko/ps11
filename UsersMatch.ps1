# Init Powershell Gui
Add-Type --AssemblyName System.Windows.Forms

# Create a new form
$UsersMatchForm = New-Object system.Windoiws.Forms.Form

# Define the size, title and background color
$UsersMatchForm.ClientSize = '800,600'
$UsersMatchForm.text = 'UsersMatch - Match users to groups'
$UsersMatchForm.BackColor = '#ffffff'

# Display the form
[void]$UsersMatchForm.ShowDialog()
