Looking to report an issue/bug or make a feature request? Please refer to the [README file](https://github.com/mihonapp/mihon#issues-feature-requests-and-contributing).

---

Thanks for your interest in contributing to Mihon!


# Code contributions

Pull requests are welcome!

If you're interested in taking on [an open issue](https://github.com/mihonapp/mihon/issues), please comment on it so others are aware.
You do not need to ask for permission nor an assignment.

## Prerequisites

Before you start, please note that the ability to use following technologies is **required** and that existing contributors will not actively teach them to you.

- Basic [Android development](https://developer.android.com/)
- [Kotlin](https://kotlinlang.org/)

### Tools

- [Android Studio](https://developer.android.com/studio)
- Emulator or phone with developer options enabled to test changes.

### Build troubleshooting (Linux/CI)

If Gradle fails very early with a short message like `What went wrong: 25.0.1`, check Java environment variables first. This error can happen when `JAVA_VERSION` is set to a non-JDK value (for example `25.0.1`).

1. Verify SDK path:
   - `echo $ANDROID_HOME`
   - `echo $ANDROID_SDK_ROOT`
2. Verify Java environment:
   - `echo $JAVA_HOME`
   - `echo $JAVA_VERSION`
   - `java -version`
   - This project expects a stable JDK (17 or 21). If your `java -version` is `25.x`, switch to JDK 21.
   - If `JAVA_VERSION` is set to something like `25.0.1`, unset it before Gradle:
     - `unset JAVA_VERSION`
3. Install/update required SDK components:
   - `sdkmanager --licenses`
   - `sdkmanager \"platform-tools\" \"platforms;android-35\" \"build-tools;35.0.0\"`
4. Re-run with diagnostics:
   - `./gradlew :app:compileStandardDebugKotlin --stacktrace --info`

## Getting help

- Join [the Discord server](https://discord.gg/mihon) for online help and to ask questions while developing.

# Translations

Translations are done externally via Weblate. See [our website](https://mihon.app/docs/contribute#translation) for more details.


# Forks

Forks are allowed so long as they abide by [the project's LICENSE](https://github.com/mihonapp/mihon/blob/main/LICENSE).

When creating a fork, remember to:

- To avoid confusion with the main app:
    - Change the app name
    - Change the app icon
    - Change or disable the [app update checker](https://github.com/mihonapp/mihon/blob/main/app/src/main/java/eu/kanade/tachiyomi/data/updater/AppUpdateChecker.kt)
- To avoid installation conflicts:
    - Change the `applicationId` in [`build.gradle.kts`](https://github.com/mihonapp/mihon/blob/main/app/build.gradle.kts)
- To avoid having your data polluting the main app's analytics and crash report services:
    - If you want to use Firebase analytics, replace [`google-services.json`](https://github.com/mihonapp/mihon/blob/main/app/src/standard/google-services.json) with your own
