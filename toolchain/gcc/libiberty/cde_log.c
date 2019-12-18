#include "cde_log.h"
#ifndef __KERNEL__
#include <string.h>
#endif

//http://www.cnblogs.com/clover-toeic/p/4031618.html

#define NONE                 "\e[0m"
#define BLACK                "\e[0;30m"
#define L_BLACK              "\e[1;30m"
#define RED                  "\e[0;31m"
#define L_RED                "\e[1;31m"
#define GREEN                "\e[0;32m"
#define L_GREEN              "\e[1;32m"
#define BROWN                "\e[0;33m"
#define L_YELLOW               "\e[1;33m"
#define BLUE                 "\e[0;34m"
#define L_BLUE               "\e[1;34m"
#define PURPLE               "\e[0;35m"
#define L_PURPLE             "\e[1;35m"
#define CYAN                 "\e[0;36m"
#define L_CYAN               "\e[1;36m"
#define WHITE                "\e[0;37m"
#define L_WHITE              "\e[1;37m"

#define BOLD                 "\e[1m"
#define UNDERLINE            "\e[4m"
#define BLINK                "\e[5m"
#define REVERSE              "\e[7m"
#define HIDE                 "\e[8m"
#define CLEAR                "\e[2J"
#define CLRLINE              "\r\e[K" //or "\e[1K\r"

static int gAllowedLogLevel = ANDROID_LOG_VERBOSE;

static int gAllowedLogEnabled = 1; //default behaviour is enable all original log output

#define LOG_BUF_LEN 4096
static char logBuf[LOG_BUF_LEN];

#define true 1
#define false 0
//tagName in source file:
typedef struct {
    const char *moduleName;
    int bModuleEnabled;
    const char *fileName;
    int bFileEnabled;
}MODULE_LOG_PROP;


//developer could modify this array to disable/enable module's log output
//we should group some source file into a standalone module:
//need sanity check with gLogPropConfs to keep consistency
static MODULE_LOG_PROP gLogPropConfs[] = {
    {"gcc",true, "gcc.c", false},
};

void setGlobalLogEnabled(int bEnable) {
    if (bEnable) {
        gAllowedLogEnabled = 1;
    } else {
        gAllowedLogEnabled = 0;
    }
}



void  setGlobalLogModule(const char *moduleName, int bEnabled) {
    size_t logPropCounts = sizeof(gLogPropConfs) / sizeof(MODULE_LOG_PROP);


    if (NULL == moduleName)
        return;

    size_t i = 0;
    for (i = 0; i < logPropCounts; i++) {
        if (gLogPropConfs[i].moduleName != NULL) {
            if (0 == memcmp(moduleName, gLogPropConfs[i].moduleName, strlen(gLogPropConfs[i].moduleName))) {
                gLogPropConfs[i].bModuleEnabled = bEnabled;
            }
        }
    }
}


void setGlobalLogLevel(int level) {
    gAllowedLogLevel = (level >= 0 ? level : ANDROID_LOG_SILENT);
}


int validateLogLevel(int prio) {
    return (prio >= gAllowedLogLevel);
}

 
#ifdef __KERNEL__
asmlinkage void  LOG_PRI_ORIG_IMPL(const char *file, const char *func, unsigned int line,  int priority, const char *tag, const char *format,  ...) {
#else
void  LOG_PRI_ORIG_IMPL(const char *file, const char *func, unsigned int line,  int priority, const char *tag, const char *format,  ...) {
#endif
    if (0 == gAllowedLogEnabled) {
        //uncomment it would disable all log output in ISMP
        //return;
    }

    //if (!validateLogLevel(priority))
    //    return;

    int bOutput = false;


#if 0 //uncomment it and modify gAllowedLogEnabled to 0, then log output would be filtered by gLogPropConfs
    size_t logPropCounts = sizeof(gLogPropConfs) / sizeof(MODULE_LOG_PROP);
    size_t i = 0;
    for (i = 0; i < logPropCounts; i++) {
        if ((tag != NULL) && (gLogPropConfs[i].fileName != NULL)) {
            if ((0 == memcmp(tag, gLogPropConfs[i].fileName, strlen(gLogPropConfs[i].fileName)))) {
                if (gLogPropConfs[i].bFileEnabled) {
                    bOutput = true;
                }
                break;
            }
        }
    }
#endif
    if (bOutput || gAllowedLogEnabled) {
        memset(logBuf, 0, LOG_BUF_LEN);
        va_list va;
        va_start(va, format);

        int len = 0;
        len = snprintf(logBuf, LOG_BUF_LEN, "[%s,%s,%d]: ", file, func, line);
        vsnprintf(logBuf + len, LOG_BUF_LEN - len, format, va);

#ifndef __KERNEL__

    #ifdef __ANDROID__
        __android_log_print(priority, tag, "%s", logBuf);
        __android_log_print(priority, tag, NONE);
    #else
        printf("%s%s\n", logBuf, NONE);
    #endif
#else
        printk(KERN_INFO "%s\n", logBuf);
#endif
        va_end(va);
    }
}
#ifdef __KERNEL__
EXPORT_SYMBOL_GPL(LOG_PRI_ORIG_IMPL);
#endif



#ifdef __KERNEL__
asmlinkage void  FINAL_LOG_PRI_ORIG_IMPL(const char *file, const char *func, unsigned int line,  int priority, const char *tag, const char *format,  ...) {
#else
void  FINAL_LOG_PRI_ORIG_IMPL(const char *file, const char *func, unsigned int line,  int priority, const char *tag, const char *format,  ...) {
#endif

    memset(logBuf, 0, LOG_BUF_LEN);

    va_list va;
    va_start(va, format);
    int len = 0;
    //tag = "";
    //len = snprintf(logBuf, LOG_BUF_LEN, "%s[%s,%s,%d]: ", L_RED, file, func, line);
    const char *color = L_RED;

    switch (priority) {
        case ANDROID_LOG_VERBOSE:
            color = L_RED;
            break;
        case ANDROID_LOG_DEBUG:
            color = L_YELLOW;
            break;
        case ANDROID_LOG_INFO:
            color = L_WHITE;
            break;
        case ANDROID_LOG_WARN:
            color = L_GREEN;
            break;
        default:
            color = L_RED;
            break;
    }
#ifndef __KERNEL__
    len = snprintf(logBuf, LOG_BUF_LEN, "%s[%s,%d]: ", color, func, line);
#else
    len = snprintf(logBuf, LOG_BUF_LEN, "[%s,%d]: ", func, line);
#endif

    vsnprintf(logBuf + len, LOG_BUF_LEN - len, format, va);

#ifndef __KERNEL__
    #ifdef __ANDROID__
    __android_log_print(priority, tag, "%s", logBuf);
    __android_log_print(priority, tag, NONE);
    #else
    printf("%s%s", logBuf, NONE);
    #endif
#else
    printk(KERN_INFO "%s", logBuf);
#endif

    va_end(va);
}
#ifdef __KERNEL__
EXPORT_SYMBOL_GPL(FINAL_LOG_PRI_ORIG_IMPL);
#endif
