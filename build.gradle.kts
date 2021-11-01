plugins {
    java
    kotlin("jvm") version "1.4.31"
    `kotlin-dsl`
    application
}

group = "org.xendv.java.edumail"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
    gradlePluginPortal()
}

dependencies {
    implementation ("org.jetbrains:annotations:13.0")
    implementation("org.flywaydb:flyway-core:8.0.1")
    implementation("org.postgresql:postgresql:42.2.9")
}

tasks.getByName<Test>("test") {
    useJUnitPlatform()
}