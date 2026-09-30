/* declarations for configfiles.c */
#ifndef CONFIGFILES_H
#define CONFIGFILES_H

char *locate_init_file (const char *init_file, const char *dot_init_file);
int run_info_hook (const char *hook, char *const argv[], char **hook_output);

#endif
