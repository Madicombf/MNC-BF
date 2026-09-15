buildscript {
    dependencies {
        // AGP 9.x ships built-in Kotlin. We pin the newer Kotlin toolchain used by
        // the Compose compiler instead of applying the legacy kotlin-android plugin.
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:2.4.20")
        classpath("com.google.devtools.ksp:symbol-processing-gradle-plugin:2.3.12")
    }
}

plugins {
    alias(libs.plugins.android.application) apply false
    alias(libs.plugins.kotlin.compose) apply false
    alias(libs.plugins.ksp) apply false
}
