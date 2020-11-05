dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}

hibernate {
    cache.use_second_level_cache = false
    cache.use_query_cache = false
    cache.EhCacheProvider = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
    //cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3

//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
//    format_sql = true
}

// environment specific settings
environments {
    development {
        dataSource {
            pooled = true
            dbCreate = "update"
            url = "jdbc:mysql://localhost/learngrails?verifyServerCertificate=false&useSSL=false&allowPublicKeyRetrieval=true"
            driverClassName = "com.mysql.jdbc.Driver"
            username = "root"
            password = "root"
        }
    }
    test {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:mysql://localhost:3306/learngrails"
            username = "root"
            password = "password"
        }
    }
    production {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:mysql://localhost:3306/learngrails"
            username = "root"
            password = "password"
        }
    }
}
