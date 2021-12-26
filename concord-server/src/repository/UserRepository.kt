package com.concord.repository

import com.concord.model.SignInCredentials
import java.util.*

interface UserRepository {
    suspend fun getBySignInCredentials(credentials: SignInCredentials): UUID
}

class UserRepositoryImpl: UserRepository {
    private val userDb = hashMapOf(
        "vini" to UUID.fromString("14caa932-6466-11ec-90d6-0242ac120003"),
        "cris" to UUID.fromString("2ddc52d6-6466-11ec-90d6-0242ac120003")
    )

    override suspend fun getBySignInCredentials(credentials: SignInCredentials): UUID {
        return userDb[credentials.token]!!
    }
}