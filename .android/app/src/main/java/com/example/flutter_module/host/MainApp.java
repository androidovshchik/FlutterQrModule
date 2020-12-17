package com.example.flutter_module.host;

import android.app.Application;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.embedding.engine.dart.DartExecutor;

public class MainApp extends Application {

    @Override
    public void onCreate() {
        super.onCreate();
        FlutterEngine flutterEngine = new FlutterEngine(getApplicationContext());
        flutterEngine.getDartExecutor().executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        );
        FlutterEngineCache
            .getInstance()
            .put("my_engine_id", flutterEngine);
    }
}