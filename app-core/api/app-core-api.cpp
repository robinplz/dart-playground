#include "app-core-api.h"
#include "../app-core.hpp"

static AppCore app;

void launchApp() {
    app.launch();
}

void shutApp() {
    app.shut();
}