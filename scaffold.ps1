$current_dir = get-location

function run_update_script($script_directory)
{
  set-location $script_directory
  .\update.ps1
  set-location $current_dir
}

run_update_script "prep\resources\dev_tools\new_solution_hack\"
