#ifndef _APP_CORE_HPP_
#define _APP_CORE_HPP_

#include "api/types.h"

class AppCore {
public:
    void launch();
    void shut();
    unsigned char* getData();
    AppMeta getMeta();
};

#endif