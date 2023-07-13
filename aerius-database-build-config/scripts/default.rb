clear_log

check_datasources

create_database :overwrite_existing

begin

  import_database_structure
  update_comments

  load_data

  # # The following flags can be set to true by the load.rb, but for performance reasons we want to execute them *after* the vacuum/analyze.
  # run_unit_tests if $do_run_unit_tests
  # validate_contents if $do_validate_contents
  # create_summary if $do_create_summary

  generate_html_documentation if has_build_flag :prod
  generate_rtf_documentation if has_build_flag :prod

  dump_database :overwrite_existing if has_build_flag :prod

  drop_database_if_exists if has_build_flag :prod

ensure

end
