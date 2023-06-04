# This script finds the largest number in an array of numbers.
# The numbers is inputed by the user

# Get the numbers from the user
$numbers = Read-Host "Enter the numbers separated by comma"

# Convert the string to array of numbers
$numbers = $numbers.Split(",")
for ($i = 0; $i -lt $numbers.Length; $i++)
{
    $numbers[$i] = [int]$numbers[$i]
}

# Find the largest number
$largestNumber = $numbers[0]
for ($i = 1; $i -lt $numbers.Length; $i++)
{
    if ($numbers[$i] -gt $largestNumber)
    {
        $largestNumber = $numbers[$i]
    }
}

# Output the result
Write-Host "The largest number is $largestNumber"