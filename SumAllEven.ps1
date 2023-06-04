# This script sums all even numbers bettern two numbers.
# The range is get from the user.

[int]$start = Read-Host "Enter the start of the range"
[int]$end = Read-Host "Enter the end of the range"

$sum = 0
for ($i = $start; $i -le $end; $i++)
{
    if ($i % 2 -eq 0)
    {
        $sum += $i
    }
}

Write-Host "The sum of all even numbers between $start and $end is $sum"