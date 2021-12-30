package com.concord.repository

import com.concord.model.UserAlias
import com.concord.model.SignInCredentials
import com.concord.model.User
import java.util.*

interface UserRepository {
    suspend fun getBySignInCredentials(credentials: SignInCredentials): User
    suspend fun getByUserAlias(alias: UserAlias): User
}

class UserRepositoryImpl: UserRepository {
    private val userDb = hashMapOf(
        "vini" to User(UUID.fromString("14caa932-6466-11ec-90d6-0242ac120003")),
        "cris" to User(UUID.fromString("2ddc52d6-6466-11ec-90d6-0242ac120003"))
    )

    private val otpDb = hashMapOf(
        "0000" to userDb["vini"],
        "1111" to userDb["cris"]
    )

    override suspend fun getBySignInCredentials(credentials: SignInCredentials): User {
        return otpDb[credentials.otp]!!
    }

    override suspend fun getByUserAlias(alias: UserAlias): User {
        return userDb[alias.alias]!!
    }
}