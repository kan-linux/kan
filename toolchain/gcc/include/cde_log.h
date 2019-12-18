#ifndef _CDE_LOG_H_
#define _CDE_LOG_H_

#ifndef __KERNEL__
#include <stdio.h>
#include <stdarg.h>
#include <unistd.h> // some code include getpid through Log.h
//#include <android/log.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Android log priority values, in ascending priority order.
 */
typedef enum android_LogPriority {
    ANDROID_LOG_UNKNOWN = 0,
    ANDROID_LOG_DEFAULT,    /* only for SetMinPriority() */
    ANDROID_LOG_VERBOSE,
    ANDROID_LOG_DEBUG,
    ANDROID_LOG_INFO,
    ANDROID_LOG_WARN,
    ANDROID_LOG_ERROR,
    ANDROID_LOG_FATAL,
    ANDROID_LOG_SILENT,     /* only for SetMinPriority(); must be last */
} android_LogPriority;


#ifndef LOG_NDEBUG
    #ifdef NDEBUG
        #define LOG_NDEBUG 1
    #else
        #define LOG_NDEBUG 0
    #endif
#endif

#ifndef LOG_TAG
    #define LOG_TAG NULL
#endif

#ifdef __GNUC__
    #define DO_NOT_INSTRUMENT __attribute__ ((no_instrument_function))
#else
    #define DO_NOT_INSTRUMENT
#endif

// ---------------------------------------------------------------------
/*
 * Log macro that allows you to specify a number for the priority.
 */
    #if LOG_NDEBUG

        #ifndef RELEASE_WITH_LOG

            #define LOG_PRI(file, func, line, priority, tag, ...) ((void)0)

        #else
            extern void setGlobalLogLevel(int);
            extern int validateLogLevel(int);

            #define LOG_PRI_ORIG(file, func, line, priority, tag, ...)  ((void)0) 


                #define LOG_PRI(file, func, line, priority, tag, fmt, args...) \
                    LOG_PRI_ORIG(file, func, line, priority, tag, "[%s:%d]: " fmt, __FUNCTION__, __LINE__,  ##args) 


        #endif /* RELEASE_WITH_LOG */

        void setGlobalLogEnabled(int bEnable);
        void setGlobalLogModule(const char *moduleName, int bEnabled);

    #else

        //disable/enable original log output
        void setGlobalLogEnabled(int bEnable);
        void setGlobalLogModule(const char *moduleName, int bEnabled);

#ifdef __KERNEL__
asmlinkage  void  LOG_PRI_ORIG_IMPL(const char *file, const char *func, unsigned int line,  int priority, const char *tag, const char *format,...);
#else
void  LOG_PRI_ORIG_IMPL(const char *file, const char *func, unsigned int line,  int priority, const char *tag, const char *format,...);
#endif

        #define LOG_PRI(file, func, line, priority, tag, ... ) \
                LOG_PRI_ORIG_IMPL(file, func, line, priority, tag, __VA_ARGS__)

    #endif /*LOG_NDEBUG*/



#ifdef __KERNEL__
asmlinkage void  FINAL_LOG_PRI_ORIG_IMPL(const char *file, const char *func, unsigned int line,  int priority, const char *tag, const char *format,...);
#else
void  FINAL_LOG_PRI_ORIG_IMPL(const char *file, const char *func, unsigned int line,  int priority, const char *tag, const char *format,...);
#endif

#define FINAL_LOG_PRI(file, func, line, priority, tag, ... ) \
             FINAL_LOG_PRI_ORIG_IMPL(file, func, line, priority, tag, __VA_ARGS__)


//used to output log message regardless global log disabled/enabled
#ifndef FINAL_LOGV
#define FINAL_LOGV(...) FINAL_LOG_PRI(__FILE__, __FUNCTION__, __LINE__, ANDROID_LOG_VERBOSE, LOG_TAG, __VA_ARGS__)
#endif

#ifndef FINAL_LOGD
#define FINAL_LOGD(...) FINAL_LOG_PRI(__FILE__, __FUNCTION__, __LINE__, ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)
#endif

#ifndef FINAL_LOGI
#define FINAL_LOGI(...) FINAL_LOG_PRI(__FILE__, __FUNCTION__, __LINE__, ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#endif

#ifndef FINAL_LOGW
#define FINAL_LOGW(...) FINAL_LOG_PRI(__FILE__, __FUNCTION__, __LINE__, ANDROID_LOG_WARN, LOG_TAG, __VA_ARGS__)
#endif


/*
 * Simplified macro to send a log message using the current LOG_TAG.
 */
#ifndef LOGV
#define LOGV(...) LOG_PRI(__FILE__, __FUNCTION__, __LINE__, ANDROID_LOG_VERBOSE, LOG_TAG, __VA_ARGS__)
#endif

#ifndef LOGD
#define LOGD(...) LOG_PRI(__FILE__, __FUNCTION__, __LINE__, ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)
#endif

#ifndef LOGI
#define LOGI(...) LOG_PRI(__FILE__, __FUNCTION__, __LINE__, ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#endif

#ifndef LOGW
#define LOGW(...) LOG_PRI(__FILE__, __FUNCTION__, __LINE__, ANDROID_LOG_WARN, LOG_TAG, __VA_ARGS__)
#endif

#ifndef LOGE
#define LOGE(...) LOG_PRI(__FILE__, __FUNCTION__, __LINE__, ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#endif



#ifdef __cplusplus
}
#endif

#endif //_CDE_LOG_H_
