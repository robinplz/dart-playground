#ifndef _APP_CORE_API_H_
#define _APP_CORE_API_H_

#ifdef __cplusplus
    #define EXTERN_C_BEGIN extern "C" {
    #define EXTERN_C_END }
#else
    #define EXTERN_C_BEGIN
    #define EXTERN_C_END
#endif

EXTERN_C_BEGIN
    void launchApp();
    void shutApp();
EXTERN_C_END

#endif