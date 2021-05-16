package by.grodno.vasili.vasili_mentoring_tasks

import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val methodChannel = MethodChannel(
                flutterEngine.dartExecutor.binaryMessenger,
                "by.grodno.vasili.flutter_mentoring/platformName"
        )
        methodChannel.setMethodCallHandler { call, result ->
            if (call.method == "getPlatformName") {
                val platform = "Android API version ${Build.VERSION.SDK_INT}"

                result.success(platform)
            } else {
                result.notImplemented()
            }
        }
    }
}
