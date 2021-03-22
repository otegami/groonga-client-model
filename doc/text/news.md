# NEWS

## 6.0.1 - 2021-03-23

### Improvements

  * Removed test files from `.gem`.
    [GitHub#6][Reported by Maciej Mensfeld]

### Thanks

  * Maciej Mensfeld

## 6.0.0 - 2021-03-18

### Improvements

  * Added support for Active Model 6 or later.

  * Added support for parallel test.

  * migration: Added support for `string` type.

  * migration: Added support for `add_index`.

  * migration: Avoided duplicated index column flags.

  * record: Added support for validation callbacks.

  * migration: Added shortcuts for integer family such as `int32`.

  * record: Added `create!`.

  * record: Added support for initializing by block.

  * record: Added `delete`.

### Fixes

  * migration: Fixed wrong `column_remove` parameter name.

## 1.0.2 - 2018-02-13

### Improvements

  * migration: Added `#rename_column` support.
    [GitHub#8][Patch by Horimoto Yasuhiro]

### Fixes

  * Fixed a bug that `groonga:schema:load` doesn't load
    `db/schema.grn`. [GitHub#1][Reported by okkez]

### Thanks

  * okkez

  * Horimoto Yasuhiro

## 1.0.1 - 2016-03-09

### Improvements

  * Supported migration: The following tasks are available:

    * `groonga:migrate`: migrates the Groonga database to the latest schema.

    * `groonga:migrate:rollback`: rollbacks the last migration.

    * `groonga:migrate:redo`: rollbacks the last migration and
      re-applies the last migration.

  * Supported auto timestamp columns (`created_at`, `created_on`,
    `updated_at` and `updated_on`) update.

  * {GroongaClientModel::Record#find}: Supported record object.

  * Added model generator.

  * Added migration generator.

  * {GroongaClientModel::Record}: Supported auto predicate method
    generation for `Bool` type columns.

### Fixes

  * Fixed a bug that groonga-client-model is the default ORM even when
    Active Record is enabled.

## 1.0.0 - 2016-02-07

### Fixes

  * Supported Rails 4 again.

## 0.9.9 - 2016-02-07

### Improvements

  * {GroongaClientModel::Record}: Added `_key` validation by default.

  * {GroongaClientModel::Record}: Supported `load --output_errors yes
    --command_version 3` introduced since Groonga 7.0.0.

  * Required groonga-client gem 0.4.1 or later.

  * Supported i18n.

## 0.9.8 - 2016-01-27

### Improvements

  * Supported auto `config/groonga.yml` generation.

  * Added `groonga_client_model:model` generator.

  * {GroongaClientModel::Record.create}: Added.

## 0.9.7 - 2016-01-20

### Improvements

  * Supported Ruby 2.0.0 again.

## 0.9.6 - 2016-01-12

### Improvements

  * Supported logging.

## 0.9.5 - 2016-12-27

### Improvements

  * Added the default presence validation for `_key`.

  * Supported validation on save by default.

  * Supported Rails 4.

  * Supported sub record class under the record class instead of
    top-level.

## 0.9.4 - 2016-12-21

### Improvements

  * Supported `eager_load!`.

## 0.9.3 - 2016-12-20

### Improvements

  * Supported using `config/groonga.yml` for test fixture.

## 0.9.2 - 2016-12-20

### Improvements

  * Supported loading `db/schema.grn` on test.

### Fixes

  * Added missing `*.rake` files.

## 0.9.1 - 2016-12-19

### Fixes

  * Fixed required groonga-client gem version.

## 0.9.0 - 2016-12-19

Initial release!!!
