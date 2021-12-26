package com.concord

import com.concord.api.auth
import com.concord.auth.authenticationBootstrap
import com.concord.repository.UserRepositoryImpl
import com.concord.webapp.about
import com.concord.webapp.home
import com.google.gson.FieldNamingPolicy
import io.ktor.application.*
import io.ktor.features.*
import io.ktor.gson.*
import io.ktor.routing.*

fun main(args: Array<String>): Unit = io.ktor.server.netty.EngineMain.main(args)

@Suppress("unused") // Referenced in application.conf
@kotlin.jvm.JvmOverloads
fun Application.module(testing: Boolean = false) {
    install(DefaultHeaders)
    install(ContentNegotiation) {
        gson {
            setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES)
        }
    }

    authenticationBootstrap()

    routing {
        home()
        about()
        auth(UserRepositoryImpl())
    }
}

