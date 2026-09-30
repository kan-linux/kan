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

#include "crypt-port.h"

#if INCLUDE_sm3crypt || INCLUDE_sm3_yescrypt

#include "alg-sm3.h"
#include "byteorder.h"

#define ROTATE(a,n) (((a)<<(n))|(((a)&0xffffffff)>>(32-(n))))

#define P0(X) (X ^ ROTATE(X, 9) ^ ROTATE(X, 17))
#define P1(X) (X ^ ROTATE(X, 15) ^ ROTATE(X, 23))

#define FF0(X,Y,Z) (X ^ Y ^ Z)
#define GG0(X,Y,Z) (X ^ Y ^ Z)

#define FF1(X,Y,Z) ((X & Y) | ((X | Y) & Z))
#define GG1(X,Y,Z) ((Z ^ (X & (Y ^ Z))))

#define EXPAND(W0,W7,W13,W3,W10) \
  (P1(W0 ^ W7 ^ ROTATE(W13, 15)) ^ ROTATE(W3, 7) ^ W10)

#define RND(A, B, C, D, E, F, G, H, TJ, Wi, Wj, FF, GG)          \
  do                                                             \
    {                                                            \
      const uint32_t A12 = ROTATE(A, 12);                        \
      const uint32_t A12_SM = A12 + E + TJ;                      \
      const uint32_t SS1 = ROTATE(A12_SM, 7);                    \
      const uint32_t TT1 = FF(A, B, C) + D + (SS1 ^ A12) + (Wj); \
      const uint32_t TT2 = GG(E, F, G) + H + SS1 + Wi;           \
      B = ROTATE(B, 9);                                          \
      D = TT1;                                                   \
      F = ROTATE(F, 19);                                         \
      H = P0(TT2);                                               \
    }                                                            \
  while(0)

#define R1(A,B,C,D,E,F,G,H,TJ,Wi,Wj) \
  RND(A,B,C,D,E,F,G,H,TJ,Wi,Wj,FF0,GG0)

#define R2(A,B,C,D,E,F,G,H,TJ,Wi,Wj) \
  RND(A,B,C,D,E,F,G,H,TJ,Wi,Wj,FF1,GG1)

  /*
   * Encode a length len*2 vector of (uint32_t) into a length len*8 vector of
   * (uint8_t) in big-endian form.
   */
  static void
  sm3_be32enc_vect(uint8_t * dst, const uint32_t * src, size_t len)
  {

    /* Encode vector, two words at a time. */
    do
      {
        be32enc(&dst[0], src[0]);
        be32enc(&dst[4], src[1]);
        src += 2;
        dst += 8;
      }
    while (--len);
  }

/*
 * Decode a big-endian length len*8 vector of (uint8_t) into a length
 * len*2 vector of (uint32_t).
 */
static void
sm3_be32dec_vect(uint32_t * dst, const uint8_t * src, size_t len)
{

  /* Decode vector, two words at a time. */
  do
    {
      dst[0] = be32dec(&src[0]);
      dst[1] = be32dec(&src[4]);
      src += 8;
      dst += 2;
    }
  while (--len);
}

static void
sm3_transform(uint32_t state[static restrict 8],
              const uint8_t block[static restrict 64],
              uint32_t W[static restrict 64])
{
  register uint32_t A, B, C, D, E, F, G, H;
  uint32_t W00, W01, W02, W03, W04, W05, W06, W07,
           W08, W09, W10, W11, W12, W13, W14, W15;

  /* 1. Prepare the first part of the message schedule W. */
  sm3_be32dec_vect(W, block, 8);

  A = state[0];
  B = state[1];
  C = state[2];
  D = state[3];
  E = state[4];
  F = state[5];
  G = state[6];
  H = state[7];

  W00 = W[0];
  W01 = W[1];
  W02 = W[2];
  W03 = W[3];
  W04 = W[4];
  W05 = W[5];
  W06 = W[6];
  W07 = W[7];
  W08 = W[8];
  W09 = W[9];
  W10 = W[10];
  W11 = W[11];
  W12 = W[12];
  W13 = W[13];
  W14 = W[14];
  W15 = W[15];

  R1(A, B, C, D, E, F, G, H, 0x79CC4519, W00, W00 ^ W04);
  W00 = EXPAND(W00, W07, W13, W03, W10);
  R1(D, A, B, C, H, E, F, G, 0xF3988A32, W01, W01 ^ W05);
  W01 = EXPAND(W01, W08, W14, W04, W11);
  R1(C, D, A, B, G, H, E, F, 0xE7311465, W02, W02 ^ W06);
  W02 = EXPAND(W02, W09, W15, W05, W12);
  R1(B, C, D, A, F, G, H, E, 0xCE6228CB, W03, W03 ^ W07);
  W03 = EXPAND(W03, W10, W00, W06, W13);
  R1(A, B, C, D, E, F, G, H, 0x9CC45197, W04, W04 ^ W08);
  W04 = EXPAND(W04, W11, W01, W07, W14);
  R1(D, A, B, C, H, E, F, G, 0x3988A32F, W05, W05 ^ W09);
  W05 = EXPAND(W05, W12, W02, W08, W15);
  R1(C, D, A, B, G, H, E, F, 0x7311465E, W06, W06 ^ W10);
  W06 = EXPAND(W06, W13, W03, W09, W00);
  R1(B, C, D, A, F, G, H, E, 0xE6228CBC, W07, W07 ^ W11);
  W07 = EXPAND(W07, W14, W04, W10, W01);
  R1(A, B, C, D, E, F, G, H, 0xCC451979, W08, W08 ^ W12);
  W08 = EXPAND(W08, W15, W05, W11, W02);
  R1(D, A, B, C, H, E, F, G, 0x988A32F3, W09, W09 ^ W13);
  W09 = EXPAND(W09, W00, W06, W12, W03);
  R1(C, D, A, B, G, H, E, F, 0x311465E7, W10, W10 ^ W14);
  W10 = EXPAND(W10, W01, W07, W13, W04);
  R1(B, C, D, A, F, G, H, E, 0x6228CBCE, W11, W11 ^ W15);
  W11 = EXPAND(W11, W02, W08, W14, W05);
  R1(A, B, C, D, E, F, G, H, 0xC451979C, W12, W12 ^ W00);
  W12 = EXPAND(W12, W03, W09, W15, W06);
  R1(D, A, B, C, H, E, F, G, 0x88A32F39, W13, W13 ^ W01);
  W13 = EXPAND(W13, W04, W10, W00, W07);
  R1(C, D, A, B, G, H, E, F, 0x11465E73, W14, W14 ^ W02);
  W14 = EXPAND(W14, W05, W11, W01, W08);
  R1(B, C, D, A, F, G, H, E, 0x228CBCE6, W15, W15 ^ W03);
  W15 = EXPAND(W15, W06, W12, W02, W09);
  R2(A, B, C, D, E, F, G, H, 0x9D8A7A87, W00, W00 ^ W04);
  W00 = EXPAND(W00, W07, W13, W03, W10);
  R2(D, A, B, C, H, E, F, G, 0x3B14F50F, W01, W01 ^ W05);
  W01 = EXPAND(W01, W08, W14, W04, W11);
  R2(C, D, A, B, G, H, E, F, 0x7629EA1E, W02, W02 ^ W06);
  W02 = EXPAND(W02, W09, W15, W05, W12);
  R2(B, C, D, A, F, G, H, E, 0xEC53D43C, W03, W03 ^ W07);
  W03 = EXPAND(W03, W10, W00, W06, W13);
  R2(A, B, C, D, E, F, G, H, 0xD8A7A879, W04, W04 ^ W08);
  W04 = EXPAND(W04, W11, W01, W07, W14);
  R2(D, A, B, C, H, E, F, G, 0xB14F50F3, W05, W05 ^ W09);
  W05 = EXPAND(W05, W12, W02, W08, W15);
  R2(C, D, A, B, G, H, E, F, 0x629EA1E7, W06, W06 ^ W10);
  W06 = EXPAND(W06, W13, W03, W09, W00);
  R2(B, C, D, A, F, G, H, E, 0xC53D43CE, W07, W07 ^ W11);
  W07 = EXPAND(W07, W14, W04, W10, W01);
  R2(A, B, C, D, E, F, G, H, 0x8A7A879D, W08, W08 ^ W12);
  W08 = EXPAND(W08, W15, W05, W11, W02);
  R2(D, A, B, C, H, E, F, G, 0x14F50F3B, W09, W09 ^ W13);
  W09 = EXPAND(W09, W00, W06, W12, W03);
  R2(C, D, A, B, G, H, E, F, 0x29EA1E76, W10, W10 ^ W14);
  W10 = EXPAND(W10, W01, W07, W13, W04);
  R2(B, C, D, A, F, G, H, E, 0x53D43CEC, W11, W11 ^ W15);
  W11 = EXPAND(W11, W02, W08, W14, W05);
  R2(A, B, C, D, E, F, G, H, 0xA7A879D8, W12, W12 ^ W00);
  W12 = EXPAND(W12, W03, W09, W15, W06);
  R2(D, A, B, C, H, E, F, G, 0x4F50F3B1, W13, W13 ^ W01);
  W13 = EXPAND(W13, W04, W10, W00, W07);
  R2(C, D, A, B, G, H, E, F, 0x9EA1E762, W14, W14 ^ W02);
  W14 = EXPAND(W14, W05, W11, W01, W08);
  R2(B, C, D, A, F, G, H, E, 0x3D43CEC5, W15, W15 ^ W03);
  W15 = EXPAND(W15, W06, W12, W02, W09);
  R2(A, B, C, D, E, F, G, H, 0x7A879D8A, W00, W00 ^ W04);
  W00 = EXPAND(W00, W07, W13, W03, W10);
  R2(D, A, B, C, H, E, F, G, 0xF50F3B14, W01, W01 ^ W05);
  W01 = EXPAND(W01, W08, W14, W04, W11);
  R2(C, D, A, B, G, H, E, F, 0xEA1E7629, W02, W02 ^ W06);
  W02 = EXPAND(W02, W09, W15, W05, W12);
  R2(B, C, D, A, F, G, H, E, 0xD43CEC53, W03, W03 ^ W07);
  W03 = EXPAND(W03, W10, W00, W06, W13);
  R2(A, B, C, D, E, F, G, H, 0xA879D8A7, W04, W04 ^ W08);
  W04 = EXPAND(W04, W11, W01, W07, W14);
  R2(D, A, B, C, H, E, F, G, 0x50F3B14F, W05, W05 ^ W09);
  W05 = EXPAND(W05, W12, W02, W08, W15);
  R2(C, D, A, B, G, H, E, F, 0xA1E7629E, W06, W06 ^ W10);
  W06 = EXPAND(W06, W13, W03, W09, W00);
  R2(B, C, D, A, F, G, H, E, 0x43CEC53D, W07, W07 ^ W11);
  W07 = EXPAND(W07, W14, W04, W10, W01);
  R2(A, B, C, D, E, F, G, H, 0x879D8A7A, W08, W08 ^ W12);
  W08 = EXPAND(W08, W15, W05, W11, W02);
  R2(D, A, B, C, H, E, F, G, 0x0F3B14F5, W09, W09 ^ W13);
  W09 = EXPAND(W09, W00, W06, W12, W03);
  R2(C, D, A, B, G, H, E, F, 0x1E7629EA, W10, W10 ^ W14);
  W10 = EXPAND(W10, W01, W07, W13, W04);
  R2(B, C, D, A, F, G, H, E, 0x3CEC53D4, W11, W11 ^ W15);
  W11 = EXPAND(W11, W02, W08, W14, W05);
  R2(A, B, C, D, E, F, G, H, 0x79D8A7A8, W12, W12 ^ W00);
  W12 = EXPAND(W12, W03, W09, W15, W06);
  R2(D, A, B, C, H, E, F, G, 0xF3B14F50, W13, W13 ^ W01);
  W13 = EXPAND(W13, W04, W10, W00, W07);
  R2(C, D, A, B, G, H, E, F, 0xE7629EA1, W14, W14 ^ W02);
  W14 = EXPAND(W14, W05, W11, W01, W08);
  R2(B, C, D, A, F, G, H, E, 0xCEC53D43, W15, W15 ^ W03);
  W15 = EXPAND(W15, W06, W12, W02, W09);
  R2(A, B, C, D, E, F, G, H, 0x9D8A7A87, W00, W00 ^ W04);
  W00 = EXPAND(W00, W07, W13, W03, W10);
  R2(D, A, B, C, H, E, F, G, 0x3B14F50F, W01, W01 ^ W05);
  W01 = EXPAND(W01, W08, W14, W04, W11);
  R2(C, D, A, B, G, H, E, F, 0x7629EA1E, W02, W02 ^ W06);
  W02 = EXPAND(W02, W09, W15, W05, W12);
  R2(B, C, D, A, F, G, H, E, 0xEC53D43C, W03, W03 ^ W07);
  W03 = EXPAND(W03, W10, W00, W06, W13);
  R2(A, B, C, D, E, F, G, H, 0xD8A7A879, W04, W04 ^ W08);
  R2(D, A, B, C, H, E, F, G, 0xB14F50F3, W05, W05 ^ W09);
  R2(C, D, A, B, G, H, E, F, 0x629EA1E7, W06, W06 ^ W10);
  R2(B, C, D, A, F, G, H, E, 0xC53D43CE, W07, W07 ^ W11);
  R2(A, B, C, D, E, F, G, H, 0x8A7A879D, W08, W08 ^ W12);
  R2(D, A, B, C, H, E, F, G, 0x14F50F3B, W09, W09 ^ W13);
  R2(C, D, A, B, G, H, E, F, 0x29EA1E76, W10, W10 ^ W14);
  R2(B, C, D, A, F, G, H, E, 0x53D43CEC, W11, W11 ^ W15);
  R2(A, B, C, D, E, F, G, H, 0xA7A879D8, W12, W12 ^ W00);
  R2(D, A, B, C, H, E, F, G, 0x4F50F3B1, W13, W13 ^ W01);
  R2(C, D, A, B, G, H, E, F, 0x9EA1E762, W14, W14 ^ W02);
  R2(B, C, D, A, F, G, H, E, 0x3D43CEC5, W15, W15 ^ W03);

  state[0] ^= A;
  state[1] ^= B;
  state[2] ^= C;
  state[3] ^= D;
  state[4] ^= E;
  state[5] ^= F;
  state[6] ^= G;
  state[7] ^= H;
}

/* Magic initialization constants. */
static const uint32_t initial_state[8] =
{
  0x7380166f, 0x4914b2b9, 0x172442d7, 0xda8a0600,
  0xa96f30bc, 0x163138aa, 0xe38dee4d, 0xb0fb0e4e
};

/**
 * sm3_init(ctx):
 * Initialize the SM3 context ${ctx}.
 */
void
sm3_init(sm3_ctx * ctx)
{

  /* Zero bits processed so far. */
  ctx->count = 0;

  /* Initialize state. */
  memcpy(ctx->state, initial_state, sizeof(initial_state));
}


/**
 * sm3_update(ctx, in, len):
 * Input ${len} bytes from ${in} into the SM3 context ${ctx}.
 */
static void
_sm3_update(sm3_ctx * ctx, const void * in, size_t len,
            uint32_t tmp32[static restrict 72])
{
  uint32_t r;
  const uint8_t * src = in;

  /* Return immediately if we have nothing to do. */
  if (len == 0)
    return;

  /* Number of bytes left in the buffer from previous updates. */
  r = (ctx->count >> 3) & 0x3f;

  /* Update number of bits. */
  ctx->count += (uint64_t)(len) << 3;

  /* Handle the case where we don't need to perform any transforms. */
  if (len < 64 - r)
    {
      memcpy(&ctx->buf[r], src, len);
      return;
    }

  /* Finish the current block. */
  memcpy(&ctx->buf[r], src, 64 - r);
  sm3_transform(ctx->state, ctx->buf, &tmp32[0]);
  src += 64 - r;
  len -= 64 - r;

  /* Perform complete blocks. */
  while (len >= 64)
    {
      sm3_transform(ctx->state, src, &tmp32[0]);
      src += 64;
      len -= 64;
    }

  /* Copy left over data into buffer. */
  memcpy(ctx->buf, src, len);
}

/* Wrapper function for intermediate-values sanitization. */
void
sm3_update(sm3_ctx * ctx, const void * in, size_t len)
{
  uint32_t tmp32[72];

  /* Call the real function. */
  _sm3_update(ctx, in, len, tmp32);

  /* Clean the stack. */
  explicit_bzero(tmp32, 288);
}

static const uint8_t PAD[64] =
{
  0x80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

/* Add padding and terminating bit-count. */
static void
sm3_pad(sm3_ctx * ctx, uint32_t tmp32[static restrict 72])
{
  size_t r;

  /* Figure out how many bytes we have buffered. */
  r = (ctx->count >> 3) & 0x3f;

  /* Pad to 56 mod 64, transforming if we finish a block en route. */
  if (r < 56)
    {
      /* Pad to 56 mod 64. */
      memcpy(&ctx->buf[r], PAD, 56 - r);
    }
  else
    {
      /* Finish the current block and mix. */
      memcpy(&ctx->buf[r], PAD, 64 - r);
      sm3_transform(ctx->state, ctx->buf, &tmp32[0]);

      /* The start of the final block is all zeroes. */
      memset(&ctx->buf[0], 0, 56);
    }

  /* Add the terminating bit-count. */
  be64enc(&ctx->buf[56], ctx->count);

  /* Mix in the final block. */
  sm3_transform(ctx->state, ctx->buf, &tmp32[0]);
}
/**
 * sm3_final(digest, ctx):
 * Output the SM3 hash of the data input to the context ${ctx} into the
 * buffer ${digest}.
 */
static void
_sm3_final(uint8_t digest[32], sm3_ctx * ctx,
           uint32_t tmp32[static restrict 72])
{

  /* Add padding. */
  sm3_pad(ctx, tmp32);

  /* Write the hash. */
  sm3_be32enc_vect(digest, ctx->state, 4);
}

/* Wrapper function for intermediate-values sanitization. */
void
sm3_final(uint8_t digest[32], sm3_ctx * ctx)
{
  uint32_t tmp32[72];

  /* Call the real function. */
  _sm3_final(digest, ctx, tmp32);

  /* Clear the context state. */
  explicit_bzero(ctx, sizeof(sm3_ctx));

  /* Clean the stack. */
  explicit_bzero(tmp32, 288);
}

/**
 * sm3_hash(in, len, digest, ctx):
 * Compute the SM3 hash of ${len} bytes from ${in} and write it to ${digest},
 * using the prepared context ${ctx}.
 */
void
sm3_hash(const void * in, size_t len, uint8_t digest[32], sm3_ctx * ctx)
{
  uint32_t tmp32[72];

  sm3_init(ctx);
  _sm3_update(ctx, in, len, tmp32);
  _sm3_final(digest, ctx, tmp32);

  /* Clean the stack. */
  explicit_bzero(tmp32, 288);
}

/**
 * sm3_buf(in, len, digest):
 * Compute the SM3 hash of ${len} bytes from ${in} and write it to ${digest}.
 */
void
sm3_buf(const void * in, size_t len, uint8_t digest[32])
{
  sm3_ctx ctx;

  sm3_hash(in, len, digest, &ctx);

  /* Clean the stack. */
  explicit_bzero(&ctx, sizeof(sm3_ctx));
}

#endif /* INCLUDE_sm3crypt || INCLUDE_sm3_yescrypt */
