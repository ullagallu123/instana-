package com.instana.robotshop.shipping;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.sql.DataSource;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Bean;
import org.springframework.beans.factory.annotation.Value;

@Configuration
public class JpaConfig {
    private static final Logger logger = LoggerFactory.getLogger(JpaConfig.class);

    @Value("${DB_HOST}")
    private String dbHost;

    @Value("${DB_PORT}")
    private String dbPort;

    @Value("${DB_USER}")
    private String dbUser;

    @Value("${DB_PASSWD}")
    private String dbPassword;
    
    @Value("${DB_DRIVER_CLASS_NAME:com.mysql.cj.jdbc.Driver}")  // Default to MySQL driver if not set
    private String driverClassName;

    @Bean
    public DataSource getDataSource() {
        String JDBC_URL = String.format("jdbc:mysql://%s:%s/cities?useSSL=false&autoReconnect=true", dbHost, dbPort);

        logger.info("jdbc url {}", JDBC_URL);

        return DataSourceBuilder.create()
                .driverClassName(driverClassName)
                .url(JDBC_URL)
                .username(dbUser)
                .password(dbPassword)
                .build();
    }
}
