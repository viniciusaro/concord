package com.concord.controllers

import com.concord.model.SignInCredentials
import com.concord.model.SignInResponse
import com.concord.repository.UserRepository
import com.google.firebase.auth.FirebaseAuth

class AuthController(
    private val userRepository: UserRepository,
) {
    private val firebaseAuth: FirebaseAuth by lazy {
        FirebaseAuth.getInstance()
    }

    suspend fun signIn(credentials: SignInCredentials): SignInResponse {
        val user = userRepository.getBySignInCredentials(credentials)
        val claims = mapOf("user_id" to user.id)
        val customToken = firebaseAuth.createCustomToken(user.toString(), claims)
        return SignInResponse(customToken)
    }
}