package com.concord.repository

import com.concord.model.SignInCredentials
import com.concord.model.User
import java.util.*

interface UserRepository {
    suspend fun getBySignInCredentials(credentials: SignInCredentials): User
}

class UserRepositoryImpl: UserRepository {
    private val userDb = hashMapOf(
        "vini" to User(UUID.fromString("14caa932-6466-11ec-90d6-0242ac120003")),
        "cris" to User(UUID.fromString("2ddc52d6-6466-11ec-90d6-0242ac120003"))
    )

    override suspend fun getBySignInCredentials(credentials: SignInCredentials): User {
        return userDb[credentials.token]!!
    }
}