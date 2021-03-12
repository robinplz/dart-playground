#include "app-core.hpp"
#include <iostream>

uint8_t * appData = nullptr;

void AppCore::launch() {
    appData = new uint8_t[1024];
    memset(appData, 0, 1024);
    const uint8_t header[] = {'d', 'a', 'r', 't'};
    memcpy(appData, header, 4);

    std::cout << "App launch." << std::endl;
}

void AppCore::shut() {
    delete []appData;
    appData = nullptr;

    std::cout << "App shut." << std::endl;
}

unsigned char* AppCore::getData() {
    return appData;
}

AppMeta AppCore::getMeta() {
    AppMeta meta;
    meta.name = "dart-playground";
    meta.majorVersion = 0;
    meta.minorVersion = 1;
    return meta;
}