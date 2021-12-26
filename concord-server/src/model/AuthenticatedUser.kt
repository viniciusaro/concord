package com.concord.model

import java.util.UUID

data class AuthenticatedUser(
    val id: UUID = UUID.randomUUID(),
)