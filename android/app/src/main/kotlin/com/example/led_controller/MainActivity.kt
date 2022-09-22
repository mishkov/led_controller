package com.example.led_controller

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.hardware.ConsumerIrManager
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import androidx.annotation.NonNull
import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {
    private val CHANNEL = "mishkov/ir"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
                if (call.method == "getBatteryLevel") {
                    val batteryLevel = getBatteryLevel()

                    if (batteryLevel != -1) {
                        result.success(batteryLevel)
                    } else {
                        result.error("UNAVAILABLE", "Battery level not available.", null)
                    }
                } else {
                    result.notImplemented()
                }
        }
    }

    private fun getBatteryLevel(): Int {
        val manager = this.getSystemService(CONSUMER_IR_SERVICE) as ConsumerIrManager
        // Check whether IrEmitter is avaiable on the device.

        // Check whether IrEmitter is avaiable on the device.
        if (!manager.hasIrEmitter()) {
            Log.e("AndroidInfraredDemo", "Cannot found IR Emitter on the device")
        }

        // Build IR Command with predefined schemes.

        // Build IR Command with predefined schemes.
        manager.transmit(38000, intArrayOf(
            9000, 4500,

            562,562,
            562,562,
            562,562,
            562,562,
            562,562,
            562,562,
            562,562,
            562,562,

            562,1687,
            562,1687,
            562,1687,
            562,1687,
            562,1687,
            562,1687,
            562,1687,
            562,1687,

            562,1687,
            562,562,
            562,1687,
            562,1687,
            562,562,
            562,1687,
            562,562,
            562,1687,

            562,562,
            562,1687,
            562,562,
            562,562,
            562,1687,
            562,562,
            562,1687,
            562,562,

            562))

        val batteryLevel: Int
        if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }

        return batteryLevel
    }
}
