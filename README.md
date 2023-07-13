
# AERIUS-Scenario
AERIUS Scenario supports the development of spatial policy and planning. Within the aerius-scenario-database several data analyses can be run.

## Setup
Setup the database build environment ([link](https://github.com/aerius/AERIUS-II/blob/master/doc/database/how_to_setup_the_database_build_environment_on_windows.md)). In contrast to the AERIUS-II repository the build script is located outside the repository. Make sure `aerius-database-build` is cloned, as well as the `aerius-database-common` repository.

Your folder structure should look something like this:
```
├── git*
│   ├── aerius-database-build
│   ├── aerius-database-common*
│   └── aerius-scenario
└── db-data
    └──  scenario
```

- `git` - you don't necessarily have to use this directory name.
- `aerius-database-common` - the is actually the AERIUS-II repository because the common code is still located in this repository.

Test the build script by running the following commands from the aerius-scenario-database folder:
- db-data sync: `ruby ..\..\aerius-database-build\bin\SyncDBData.rb settings.rb --from-sftp --to-local`
- test-structure: `ruby ..\..\aerius-database-build\bin\Build.rb test_structure.rb settings.rb -v structure`
- build database: `ruby ..\..\aerius-database-build\bin\Build.rb default settings.rb -v #`

## Running a data analysis
The analyses can be automatically run during a database build. You can enable/disable them in the database [load.rb](aerius-scenario-database/src/data/sql/load.rb).
