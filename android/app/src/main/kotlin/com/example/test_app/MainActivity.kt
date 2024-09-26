package com.example.test_app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import okhttp3.*
import okhttp3.MediaType.Companion.toMediaTypeOrNull
import okhttp3.RequestBody.Companion.toRequestBody
import java.io.IOException
import androidx.annotation.NonNull // Ensure this import is present

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.test_app/api"
    private val client = OkHttpClient()

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "login") {
                val email = call.argument<String>("email")
                val password = call.argument<String>("password")
                login(email, password, result)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun login(email: String?, password: String?, result: MethodChannel.Result) {
        val url = "https://scratchy.esferasoft.in/api/login"
        val requestBody = """{
            "email": "$email",
            "password": "$password",
            "device_token": "",
            "device_type": "android"
        }""".toRequestBody("application/json".toMediaTypeOrNull())

        val request = Request.Builder()
            .url(url)
            .post(requestBody)
            .build()

        client.newCall(request).enqueue(object : Callback {
            override fun onFailure(call: Call, e: IOException) {
                result.error("ERROR", "Network request failed", null)
            }

            override fun onResponse(call: Call, response: Response) {
                if (response.isSuccessful) {
                    val responseData = response.body?.string()
                    result.success(responseData)
                } else {
                    result.error("ERROR", response.message, null)
                }
            }
        })
    }
}
