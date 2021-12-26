package com.concord.webapp

import io.ktor.application.*
import io.ktor.response.*
import io.ktor.routing.*

fun Route.about() {
    get("/about") {
        call.respondText("About")
    }
}