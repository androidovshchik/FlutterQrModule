package com.example.flutter_module.host;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;

import io.flutter.embedding.android.FlutterFragment;

public class MainActivity extends FragmentActivity {

    private static final String TAG_FLUTTER_FRAGMENT = "flutter_fragment";

    private FlutterFragment flutterFragment;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        FragmentManager fragmentManager = getSupportFragmentManager();
        flutterFragment = (FlutterFragment) fragmentManager.findFragmentByTag(TAG_FLUTTER_FRAGMENT);
        if (flutterFragment == null) {
            flutterFragment = FlutterFragment.withCachedEngine("my_engine_id")
                .build();
            fragmentManager
                .beginTransaction()
                .add(
                    R.id.fl_container,
                    flutterFragment,
                    TAG_FLUTTER_FRAGMENT
                )
                .commit();
        }
    }

    @Override
    protected void onPostResume() {
        super.onPostResume();
        flutterFragment.onPostResume();
    }

    @Override
    @SuppressLint("MissingSuperCall")
    protected void onNewIntent(Intent intent) {
        flutterFragment.onNewIntent(intent);
    }

    @Override
    protected void onUserLeaveHint() {
        flutterFragment.onUserLeaveHint();
    }

    @Override
    public void onTrimMemory(int level) {
        super.onTrimMemory(level);
        flutterFragment.onTrimMemory(level);
    }

    @Override
    public void onRequestPermissionsResult(
        int requestCode,
        @NonNull String[] permissions,
        @NonNull int[] grantResults
    ) {
        flutterFragment.onRequestPermissionsResult(
            requestCode,
            permissions,
            grantResults
        );
    }

    @Override
    public void onBackPressed() {
        flutterFragment.onBackPressed();
    }
}