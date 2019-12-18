static const char *const multilib_raw[] = {
". !m64 !m32;",
"64:../lib64:x86_64-linux-gnu m64 !m32;",
"32:../lib32:i386-linux-gnu !m64 m32;",
NULL
};

static const char *const multilib_reuse_raw[] = {
NULL
};

static const char *const multilib_matches_raw[] = {
"m64 m64;",
"m32 m32;",
NULL
};

static const char *multilib_extra = "";

static const char *const multilib_exclusions_raw[] = {
NULL
};

static const char *multilib_options = "m64/m32";
