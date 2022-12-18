
$scad_files = @(Get-ChildItem *.scad)
foreach ($file in $scad_files) {
    $stl_file = $file.FullName -replace '\.scad$', '.stl' 
    $cmd = "openscad -o $stl_file $file"
    Write-Host $cmd
    Invoke-Expression $cmd
}
write-host "Done"