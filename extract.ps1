$content = Get-Content index.html -Raw
$scriptContent = [regex]::Match($content, '(?s)<script type="module">(.*?)</script>').Groups[1].Value
Set-Content -Path script.js -Value $scriptContent -Encoding utf8
$classes = [regex]::Matches($scriptContent, 'className:"([^"]+)"') | ForEach-Object { $_.Groups[1].Value }
$classes | Select-Object -Unique | Set-Content -Path classes.txt -Encoding utf8
