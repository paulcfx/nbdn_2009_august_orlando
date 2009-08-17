  $framework_dir = "$env:systemroot\microsoft.net\framework\v2.0.50727"
  $base_dir = $pwd
  $root_project_folders = "$base_dir\prep\exercise_to_complete_for_day_1" ,"$base_dir\store\trunk"
  $dev_tools_folder = "$base_dir\prep\resources\dev_tools"
  $project_product_folders = "$base_dir\prep\exercise_to_complete_for_day_1\product\nothinbutdotnetprep" ,"$base_dir\store\trunk\product\nothinbutdotnetstore"
  $third_party = "developwithpassion.bdd","developwithpassion.bdddoc","developwithpassion.commons","mbunit","rhino.mocks","log4net","nhibernate","fluent.nhibernate","castle"
  $base_sources = @{ "development/projects/builds/trunk" = ""; }
  $files_to_prune = ("project.rb.template")


function update_external_tools{
  foreach($folder in $root_project_folders) {
    $base_sources.keys | foreach-object { svn export "svn://bitwisemaster/$_" "$folder$($base_sources[$_])" --force }
    $third_party | foreach-object { svn export "svn://bitwisemaster/thirdparty/open_source/binaries/$_" "$folder\thirdparty\$_" --force }
    $files_to_prune | foreach-object{remove-item "$folder\$_"}
  }
}

function update_powershell{
 $result = svn export "svn://bitwisemaster/development/tools/powershell" "$dev_tools_folder\powershell" --force
 $result
}

function update_dev_tools{
  $result = svn export "svn://bitwisemaster/development/tools/resharper" "$dev_tools_folder\resharper" --force
  $result += svn export "svn://bitwisemaster/development/tools/autohotkey/jpscripts" "$dev_tools_folder\autohotkey" --force

  $result
}

function update_autohotkey_scripts{
}

function update_source{
  $result = svn export "svn://bitwisemaster/training/nothinbutdotnet/coursebase" "$base_dir" --force
  $result
}



update_external_tools
update_powershell
update_source
update_dev_tools


