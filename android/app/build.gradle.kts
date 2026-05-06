plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}


android {
    namespace = "com.hakk.hack"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
        isCoreLibraryDesugaringEnabled = true  // ← أضف هذا السطر
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.hakk.hack"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}

configurations.all {
    resolutionStrategy {
        // Force newer versions of deprecated androidx libraries
        force("androidx.appcompat:appcompat:1.6.1")
        force("androidx.recyclerview:recyclerview:1.3.2")
        force("androidx.preference:preference:1.2.1")
        force("androidx.legacy:legacy-support-core-ui:1.0.0")
        force("androidx.legacy:legacy-support-core-utils:1.0.0")
        force("androidx.slidingpanelayout:slidingpanelayout:1.2.0")
        force("androidx.fragment:fragment-ktx:1.6.2")
        force("androidx.activity:activity-ktx:1.8.1")
        force("androidx.lifecycle:lifecycle-runtime-ktx:2.7.0")
        force("androidx.lifecycle:lifecycle-viewmodel-ktx:2.7.0")
        force("androidx.datastore:datastore-preferences-android:1.1.7")
        force("androidx.datastore:datastore-core-android:1.1.7")
        force("androidx.datastore:datastore-android:1.1.7")
        force("androidx.datastore:datastore-preferences-core-android:1.1.7")
    }
}

flutter {
    source = "../.."
}