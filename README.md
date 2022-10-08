# flyway-integration-springboot
Integrade flyway with spring boot 


### Add plugin and get flyway tasks into gradle tasks

<pre>
plugins {
	id "org.flywaydb.flyway" version "8.0.0"
}
</pre>

### flyway gradle plugin configuration
<pre>
flyway {
	url = 'jdbc:mysql://localhost:3306/flyway_integration'
	user = 'root'
	password = 'root'
}
</pre>

### File name formate under `src/main/resource/db/migration

>\<Prefix\>\<Version\>__\<Description\>.sql
>
>V1_0__init.sql

### If you do not want automatic db migration when running the application
<pre>
@Bean
public FlywayMigrationStrategy flywayMigrationStrategy(){
	return args ->{};
}
</pre>

### Gradle Task: flywayMigrate
Migrates the schema to the latest version. Flyway will create the schema history table automatically if it doesn’t exist.
> gradle flywayMigrate

### Gradle Task: flywayClean
Drops all objects (tables, views, procedures, triggers, …) in the configured schemas.
The schemas are cleaned in the order specified by the schemas and defaultSchema property.
> gradle flywayClean

### Gradle Task: flywayInfo
Prints the details and status information about all the migrations.
> gradle flywayInfo

### Gradle Task: flywayValidate
Validate applied migrations against resolved ones (on the filesystem or classpath) to detect accidental changes that may prevent the schema(s) from being recreated exactly.

Validation fails if

differences in migration names, types or checksums are found
versions have been applied that aren’t resolved locally anymore
versions have been resolved that haven’t been applied yet
> gradle flywayValidate

### Gradle Task: flywayBaseline
Baselines an existing database, excluding all migrations up to and including baselineVersion.
> gradle flywayBaseline

### Gradle Task: flywayRepair
Repairs the Flyway schema history table. This will perform the following actions:

Remove any failed migrations on databases without DDL transactions
(User objects left behind must still be cleaned up manually)
Realign the checksums, descriptions and types of the applied migrations with the ones of the available migrations
> gradle flywayRepair
