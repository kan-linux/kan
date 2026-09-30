/* Copyright (C) 2024 Björn Esser <besser82@fedoraproject.org>
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

#ifndef _CRYPT_ALG_SM3_HMAC_H
#define _CRYPT_ALG_SM3_HMAC_H

#include "alg-sm3.h"

typedef struct
{
  sm3_ctx sm3_ctx;
  uint8_t key[64];
} sm3_hmac_ctx_t;

void sm3_hmac_init (sm3_hmac_ctx_t * ctx, const uint8_t * key,
                    size_t key_len);
void sm3_hmac_update (sm3_hmac_ctx_t * ctx, const uint8_t * data,
                      size_t data_len);
void sm3_hmac_final (sm3_hmac_ctx_t * ctx, uint8_t mac[32]);
void sm3_hmac (const uint8_t * data, size_t data_len,
               const uint8_t * key, size_t key_len,
               uint8_t mac[32], sm3_hmac_ctx_t * ctx);
void sm3_hmac_buf (const uint8_t * data, size_t data_len,
                   const uint8_t * key, size_t key_len,
                   uint8_t mac[32]);

#endif /* _CRYPT_ALG_SM3_HMAC_H */
