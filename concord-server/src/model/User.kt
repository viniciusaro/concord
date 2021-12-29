package com.concord.model

import java.util.UUID

data class User(
    val id: UUID = UUID.randomUUID(),
)