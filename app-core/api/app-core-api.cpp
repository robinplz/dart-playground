#include "app-core-api.h"
#include "../app-core.hpp"
#include <random>

static AppCore app;

void launchApp() {
    app.launch();
}

void shutApp() {
    app.shut();
}

unsigned char* getAppData() {
    return app.getData();
}

AppMeta getAppMeta() {
    return app.getMeta();
}

int generateRandomError(int* error) {
    static int i = 100;
    i++;
    (*error) = i;
    return i;
}