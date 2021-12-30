package com.concord.controllers

import com.concord.model.*
import com.concord.repository.UserRepository
import com.google.firebase.auth.FirebaseAuth

class AuthController(
    private val userRepository: UserRepository,
) {
    private val firebaseAuth: FirebaseAuth by lazy {
        FirebaseAuth.getInstance()
    }

    suspend fun sendOtp(alias: UserAlias): OkResponse {
        val user = userRepository.getByUserAlias(alias)
        return OkResponse()
    }

    suspend fun signIn(credentials: SignInCredentials): SignInResponse {
        val user = userRepository.getBySignInCredentials(credentials)
        val customToken = firebaseAuth.createCustomToken(user.id.toString())
        return SignInResponse(customToken)
    }
}