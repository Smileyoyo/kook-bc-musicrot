plugins {
    `java-library`
}

group = "com.smileyoyo"
version = "1.0.0"

repositories {
    mavenCentral()
    maven { url = uri("https://jitpack.io") }
}

dependencies {
    // JKook API（由 KookBC 提供）
    compileOnly("io.github.snwcreations:jkook:0.54.2")

    // HTTP 客户端
    implementation("com.squareup.okhttp3:okhttp:4.12.0")

    // JSON 处理
    implementation("com.google.code.gson:gson:2.10.1")

    // 日志（JKook 已包含）
    implementation("org.slf4j:slf4j-api:2.0.9")

    // Apache Commons
    implementation("org.apache.commons:commons-lang3:3.14.0")

    // Lombok
    compileOnly("org.projectlombok:lombok:1.18.30")
    annotationProcessor("org.projectlombok:lombok:1.18.30")
}

tasks {
    compileJava {
        options.encoding = "UTF-8"
    }

    jar {
        archiveFileName.set("kook-music-bot.jar")
    }
}
