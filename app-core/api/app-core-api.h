#ifndef _APP_CORE_API_H_
#define _APP_CORE_API_H_

#include "types.h"

#ifdef __cplusplus
    #define EXTERN_C_BEGIN extern "C" {
    #define EXTERN_C_END }
#else
    #define EXTERN_C_BEGIN
    #define EXTERN_C_END
#endif

#ifdef WIN32
#define EXPORT __declspec(dllexport)
#else
#define EXPORT
#endif

EXTERN_C_BEGIN
    EXPORT void launchApp();
    EXPORT void shutApp();
    EXPORT unsigned char* getAppData();
    EXPORT AppMeta getAppMeta();
    EXPORT int generateRandomError(int* error);
EXTERN_C_END

#endif