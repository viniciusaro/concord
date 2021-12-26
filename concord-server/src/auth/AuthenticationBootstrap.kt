package com.concord.auth

import com.google.auth.oauth2.GoogleCredentials
import com.google.firebase.FirebaseApp
import com.google.firebase.FirebaseOptions
import io.ktor.application.*

object AuthenticationBootstrap {
    fun init() {
        val credentials = javaClass.classLoader.getResourceAsStream("firebase_dev_service_account.json")

        val options = FirebaseOptions.builder()
            .setCredentials(GoogleCredentials.fromStream(credentials))
            .build()

        FirebaseApp.initializeApp(options)
    }
}

fun Application.authenticationBootstrap() {
    environment.monitor.subscribe(ApplicationStarted) {
        AuthenticationBootstrap.init()
    }
}