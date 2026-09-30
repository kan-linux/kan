/* call_embed_perl.h - API to embed perl from C code */
#ifndef CALL_EMBED_PERL_H
#define CALL_EMBED_PERL_H

void call_eval_use_module (const char *module_name);

int call_init_perl (int *argc_ref, char ***argv_ref, char ***env_ref,
                    char *load_txi_modules_path, const char *version_checked);
void call_finish_perl (void);
#endif
