add_build_constants

run_sql "data.sql"
run_sql "data_dash.sql"
#run_sql "data_farm.sql"
# run_sql "data_industry.sql"
#run_sql "keys.sql"
#run_sql "indexes.sql"

if has_build_flag :quick then
  analyze_vacuum_database :analyze
else
  analyze_vacuum_database :vacuum, :analyze
end

# run_sql "analysis/analysis1.sql"
# run_sql "analysis/analysis1b.sql"
# run_sql "analysis/analysis2.sql"
# run_sql "analysis/analysis3.sql"
# run_sql "analysis/analysis4.sql"
# run_sql "analysis/analysis5.sql"
# run_sql "analysis/analysis5b.sql"

# run_sql_folder "analysis/lbv_20200901"

# run_sql "analysis/industry/origin_depositions.sql"
