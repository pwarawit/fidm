#!/usr/bin/env bash

# This script configure pentaho to use postgresql as BA repository 

# Change the tomcat context.xml file (/opt/pentaho/biserver-ce/tomcat/webapps/pentaho/META-INF/context.xml)
cp /opt/pentaho/biserver-ce/tomcat/webapps/pentaho/META-INF/context.xml /opt/pentaho/biserver-ce/tomcat/webapps/pentaho/META-INF/context.xml.oirig
sudo sed -i s/"org.hsqldb.jdbcDriver"/"org.postgresql.Driver"/g /opt/pentaho/biserver-ce/tomcat/webapps/pentaho/META-INF/context.xml
sudo sed -i s/"jdbc:hsqldb:hsql:\/\/localhost\/hibernate"/"jdbc:postgresql:\/\/localhost:5432\/hibernate"/g /opt/pentaho/biserver-ce/tomcat/webapps/pentaho/META-INF/context.xml
sudo sed -i s/"select count(\*) from INFORMATION_SCHEMA.SYSTEM_SEQUENCES"/"select 1"/g /opt/pentaho/biserver-ce/tomcat/webapps/pentaho/META-INF/context.xml
sudo sed -i s/"org.hsqldb.jdbcDriver"/"org.postgresql.Driver"/g /opt/pentaho/biserver-ce/tomcat/webapps/pentaho/META-INF/context.xml
sudo sed -i s/"jdbc:hsqldb:hsql:\/\/localhost\/quartz"/"jdbc:postgresql:\/\/localhost:5432\/quartz"/g /opt/pentaho/biserver-ce/tomcat/webapps/pentaho/META-INF/context.xml
sudo sed -i s/"select count(\*) from INFORMATION_SCHEMA.SYSTEM_SEQUENCES"/"select 1"/g /opt/pentaho/biserver-ce/tomcat/webapps/pentaho/META-INF/context.xml

# Change the hibernate-settings.xml files (/opt/pentaho/biserver-ce/pentaho-solutions/system/hibernate/hibernate-settings.xml)
cp /opt/pentaho/biserver-ce/pentaho-solutions/system/hibernate/hibernate-settings.xml /opt/pentaho/biserver-ce/pentaho-solutions/system/hibernate/hibernate-settings.xml.orig
sudo sed -i s/"system\/hibernate\/hsql.hibernate.cfg.xml"/"system\/hibernate\/postgresql.hibernate.cfg.xml"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/hibernate/hibernate-settings.xml

# Change the hibernate security properties file (/opt/pentaho/biserver-ce/pentaho-solutions/system/applicationContext-spring-security-hibernate.properties)
cp /opt/pentaho/biserver-ce/pentaho-solutions/system/applicationContext-spring-security-hibernate.properties /opt/pentaho/biserver-ce/pentaho-solutions/system/applicationContext-spring-security-hibernate.properties.orig
sudo sed -i s/"org.hsqldb.jdbcDriver"/"org.postgresql.Driver"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/applicationContext-spring-security-hibernate.properties
sudo sed -i s/"jdbc:hsqldb:hsql:\/\/localhost\/hibernate"/"jdbc:postgresql:\/\/localhost:5432\/hibernate"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/applicationContext-spring-security-hibernate.properties

# Change the jdbc properties file (/opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties)
cp /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties.orig
sudo sed -i s/"SampleData\/type=javax.sql.DataSource"/"#SampleData\/type=javax.sql.DataSource"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
sudo sed -i s/"SampleData\/driver=org.hsqldb.jdbcDriver"/"#SampleData\/driver=org.hsqldb.jdbcDriver"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
sudo sed -i s/"SampleData\/url=jdbc:hsqldb:hsql:\/\/localhost\/sampledata"/"#SampleData\/url=jdbc:hsqldb:hsql:\/\/localhost\/sampledata"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
sudo sed -i s/"SampleData\/user=pentaho_user"/"#SampleData\/user=pentaho_user"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
sudo sed -i s/"SampleData\/password=password"/"#SampleData\/password=password"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
sudo sed -i s/"Hibernate\/driver=org.hsqldb.jdbcDriver"/"Hibernate\/driver=org.postgresql.Driver"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
sudo sed -i s/"Hibernate\/url=jdbc:hsqldb:hsql:\/\/localhost\/hibernate"/"Hibernate\/url=jdbc:postgresql:\/\/localhost:5432\/hibernate"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
sudo sed -i s/"Quartz\/driver=org.hsqldb.jdbcDriver"/"Quartz\/driver=org.postgresql.Driver"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
sudo sed -i s/"Quartz\/url=jdbc:hsqldb:hsql:\/\/localhost\/quartz"/"Quartz\/url=jdbc:postgresql:\/\/localhost:5432\/quartz"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
sudo sed -i s/"Shark\/type=javax.sql.DataSource"/"#Shark\/type=javax.sql.DataSource"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
sudo sed -i s/"Shark\/driver=org.hsqldb.jdbcDriver"/"#Shark\/driver=org.hsqldb.jdbcDriver"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
sudo sed -i s/"Shark\/url=jdbc:hsqldb:hsql:\/\/localhost\/shark"/"#Shark\/url=jdbc:hsqldb:hsql:\/\/localhost\/shark"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
sudo sed -i s/"Shark\/user=sa"/"#Shark\/user=sa"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
sudo sed -i s/"Shark\/password="/"#Shark\/password="/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
sudo sed -i s/"SampleDataAdmin\/type=javax.sql.DataSource"/"#SampleDataAdmin\/type=javax.sql.DataSource"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
sudo sed -i s/"SampleDataAdmin\/driver=org.hsqldb.jdbcDriver"/"#SampleDataAdmin\/driver=org.hsqldb.jdbcDriver"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
sudo sed -i s/"SampleDataAdmin\/url=jdbc:hsqldb:hsql:\/\/localhost\/sampledata"/"#SampleDataAdmin\/url=jdbc:hsqldb:hsql:\/\/localhost\/sampledata"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
sudo sed -i s/"SampleDataAdmin\/user=pentaho_admin"/"#SampleDataAdmin\/user=pentaho_admin"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
sudo sed -i s/"SampleDataAdmin\/password=password"/"#SampleDataAdmin\/password=password"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties

# Copy the modified file from /opt/fidm/install/jackrabbit-postgresql-repository.xml to /opt/pentaho
mv /opt/pentaho/biserver-ce/pentaho-solutions/system/jackrabbit/repository.xml /opt/pentaho/biserver-ce/pentaho-solutions/system/jackrabbit/repository.xml.orig
cp /opt/fidm/install/jackrabbit-postgresql-repository.xml /opt/pentaho/biserver-ce/pentaho-solutions/system/jackrabbit/repository.xml
chown pentaho:pentaho /opt/pentaho/biserver-ce/pentaho-solutions/system/jackrabbit/repository.xml
