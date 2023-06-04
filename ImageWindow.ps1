# This script shows a GUI window with an image of the user's choice

# Import the 'System.Windows.Forms' namespace
Add-Type -AssemblyName System.Windows.Forms

# Create a form
$form = New-Object System.Windows.Forms.Form

# Set the form's title
$form.Text = "Image Window"

# Set the form's width and height
$form.Width = 500
$form.Height = 500

# Fix the size of the form
$form.FormBorderStyle = "FixedSingle"

# Add a button to the form
$button = New-Object System.Windows.Forms.Button
$button.Text = "Select an image file"
$button.Width = 200
$button.Height = 30
# Center the button
$button.Left = ($form.Width - $button.Width) / 2
$button.Top = ($form.Height - $button.Height) / 2
# Add the button to the form
$form.Controls.Add($button)

# Define an event handler for the button's click event, which will be triggered when the user clicks the button to select the image file
$button.Add_Click({

    # Create an open file dialog
    $openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    # Set the title of the dialog
    $openFileDialog.Title = "Select an image file"
    # Set the filter of the dialog
    $openFileDialog.Filter = "Image files (*.jpg, *.jpeg, *.png, *.gif) | *.jpg; *.jpeg; *.png; *.gif"
    # Show the dialog
    $openFileDialog.ShowDialog()
    # If the user clicks the 'Cancel' button, then return
    if ($openFileDialog.FileName -eq "")
    {
        return
    }

    # Should clear previous picture box, if any
    foreach ($control in $form.Controls)
    {
        if ($control.GetType().Name -eq "PictureBox")
        {
            $form.Controls.Remove($control)
        }
    }
    # Get the path of the selected file
    $imagePath = $openFileDialog.FileName
    # Create an image object from the image file
    $image = [System.Drawing.Image]::FromFile($imagePath)
    # Create a picture box
    $pictureBox = New-Object System.Windows.Forms.PictureBox
    # Set the size mode of the picture box to 'Zoom', so that the image will be zoomed to fit the picture box
    $pictureBox.SizeMode = "Zoom"
    # Set the size of the picture box to the size of the form
    $pictureBox.Width = $form.Width
    $pictureBox.Height = $form.Height
    # Set the image of the picture box to the image object
    $pictureBox.Image = $image
    # Add the picture box to the form
    $form.Controls.Add($pictureBox)
})

# Display the form
$form.ShowDialog()