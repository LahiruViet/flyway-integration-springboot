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
<pre>
