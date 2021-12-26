package com.concord.api

import com.concord.controllers.AuthController
import com.concord.model.SignInCredentials
import com.concord.repository.UserRepository
import io.ktor.application.*
import io.ktor.request.*
import io.ktor.response.*
import io.ktor.routing.*

fun Route.auth(userRepository: UserRepository) {
    post("/sign_in") {
        val controller = AuthController(userRepository)
        val credentials = call.receive<SignInCredentials>()
        call.respond(controller.signIn(credentials))
    }
}