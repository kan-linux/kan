/*
 * Copyright (c) 2025 Björn Esser <besser82 at fedoraproject.org>
 * All rights reserved.
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted.
 *
 * THE SOFTWARE IS PROVIDED “AS IS” AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

#ifndef _CRYPT_ALG_SM3_H
#define _CRYPT_ALG_SM3_H

#include "crypt-port.h"

#include <stdint.h>

/* Context structure for SM3 operations. */
typedef struct
{
  uint32_t state[8];
  uint64_t count;
  uint8_t buf[64];
} sm3_ctx;

/**
 * sm3_init(ctx):
 * Initialize the SM3 context ${ctx}.
 */
extern void sm3_init(sm3_ctx *);

/**
 * sm3_update(ctx, in, len):
 * Input ${len} bytes from ${in} into the SM3 context ${ctx}.
 */
extern void sm3_update(sm3_ctx *, const void *, size_t);

/**
 * sm3_final(digest, ctx):
 * Output the SM3 hash of the data input to the context ${ctx} into the
 * buffer ${digest}.
 */
extern void sm3_final(uint8_t[32], sm3_ctx *);

/**
 * sm3_hash(in, len, digest, ctx):
 * Compute the SM3 hash of ${len} bytes from ${in} and write it to ${digest},
 * using the prepared context ${ctx}.
 */
extern void sm3_hash(const void *, size_t, uint8_t[32], sm3_ctx *);

/**
 * sm3_buf(in, len, digest):
 * Compute the SM3 hash of ${len} bytes from ${in} and write it to ${digest}.
 */
extern void sm3_buf(const void *, size_t, uint8_t[32]);
#endif /* _CRYPT_ALG_SM3_H */
