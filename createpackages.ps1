get-childitem -recurse -include *.nupkg | Remove-Item

$nuspecFiles = get-childitem -recurse -include *.nuspec
foreach($i in $nuspecFiles)
{
    &nuget.exe pack $i.FullName
}