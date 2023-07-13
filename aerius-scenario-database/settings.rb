#
# Product specific settings. Can optionally override in MeldingSettings.User.rb (same location)
#

$product = :scenario    # The product these settings are for.

#-------------------------------------

sql_path = '/src/main/sql/'
data_path = '/src/data/sql/'
build_config = 'aerius-database-build-config'
common_module = 'aerius-database-common'
settings_file = 'AeriusSettings.rb'

#-------------------------------------

$project_settings_file = File.expand_path(File.dirname(__FILE__) + '/../' + build_config + '/config/' + settings_file).fix_pathname

# $common_sql_path = File.expand_path(File.dirname(__FILE__) + '/../../'+ common_module +'/' + common_module + '/' + sql_path).fix_pathname # other repo
# $common_sql_path = File.expand_path(File.dirname(__FILE__) + '/../../' + sql_path).fix_pathname
# $common_sql_path = 'C:/aerius/git/aerius-monitor-web/aerius-database-common'+ sql_path
$common_sql_path = 'C:/aerius/git/AERIUS-II/source/database/src/main/sql/common'
$product_sql_path = File.expand_path(File.dirname(__FILE__) + '/' + sql_path).fix_pathname
#
# $product_sql_path = File.expand_path(File.dirname(__FILE__) + '/../' + sql_path).fix_pathname # current repo
$common_data_path = File.expand_path(File.dirname(__FILE__) + '/' + data_path).fix_pathname
#$common_data_path = File.expand_path(File.dirname(__FILE__) + '/../../'+ common_module +'/' + common_module + '/' + data_path).fix_pathname # other repo
$product_data_path = File.expand_path(File.dirname(__FILE__) + '/' + data_path).fix_pathname # current repo
