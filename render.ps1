
$scad_files = @(Get-ChildItem *.scad)
foreach ($file in $scad_files) {
    $stl_file = $file.FullName -replace '\.scad$', '.stl' 
    & openscad -o $stl_file $file
}
write-host "Done"