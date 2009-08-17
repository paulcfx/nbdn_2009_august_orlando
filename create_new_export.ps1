$orignal_dir = get-location

if (test-path C:\local\coursebaseexp)
{
  remove-item C:\local\coursebaseexp -recurse -force
}
svn export svn://bitwisemaster/training/nothinbutdotnet/coursebase C:\local\coursebaseexp

set-location C:\local\coursebaseexp
.\build.ps1

remove-item build.ps1 -force
remove-item create_new_export.ps1 -force
set-location $orignal_dir


