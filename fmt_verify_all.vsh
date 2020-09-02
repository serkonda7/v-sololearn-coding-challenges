#!/usr/local/bin/v run

root_dir := resource_abs_path('.')
v_files := walk_ext(root_dir, '.v')
mut errs := 0
for file in v_files {
	ret := system('v fmt -verify $file')
	if ret != 0 {
		errs++
	}
}
if errs > 0 {
	println('Error: $errs of $v_files.len files are not formatted')
	exit(1)
}
