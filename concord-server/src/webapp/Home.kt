package com.concord.webapp

import io.ktor.application.*
import io.ktor.response.*
import io.ktor.routing.*

fun Route.home() {
    get("/") {
        call.respondText("Home")
    }
}