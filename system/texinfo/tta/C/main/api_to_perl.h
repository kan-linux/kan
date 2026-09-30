/* api_to_perl.h - API to interact with perl from C code */
#ifndef API_TO_PERL_H
#define API_TO_PERL_H

int get_refcount (void *sv);

void unregister_perl_data (void *sv);
void register_perl_data (void *sv);
char *call_close_perl_io (void *io);

void call_switch_to_global_locale (void);
void call_sync_locale (void);
void croak_message (char *message);

void *get_sv_hv (const void *sv);

void show_sv_hv (const void *sv, const char *msg);
#endif
