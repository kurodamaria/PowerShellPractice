# This script counts the unique words in a sentence inputed by the user.

$sentence = Read-Host "Enter a sentence"

$words = $sentence.Split(" ")

# Let's use hash table instead
$uniqueWords = @{}

foreach ($word in $words)
{
    if ($uniqueWords.ContainsKey($word))
    {
        $uniqueWords[$word]++
    }
    else
    {
        $uniqueWords[$word] = 1
    }
}

Write-Host "The unique words are:"
foreach ($word in $uniqueWords.Keys)
{
    Write-Host "$word - $($uniqueWords[$word])"
}

# Output the number of unique words
Write-Host "The number of unique words is $($uniqueWords.Count)"