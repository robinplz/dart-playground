#ifndef _APP_CORE_API_H_
#define _APP_CORE_API_H_

#include "types.h"
#include "macros.h"
#include "signal.h"

EXTERN_C_BEGIN
    EXPORT void launchApp();
    EXPORT void shutApp();
    EXPORT unsigned char* getAppData();
    EXPORT AppMetaResult getAppMeta();
    EXPORT int generateRandomError(int* error);
    EXPORT void setObserver(Signal sig, CALLBACK func);
EXTERN_C_END

#endif /* _APP_CORE_API_H_ */
