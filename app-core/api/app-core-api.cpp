#include "app-core-api.h"
#include "../app-core.hpp"
#include <random>
#include <map>
#include <memory>

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

AppMetaResult getAppMeta() {
    AppMetaResult result;
    result.status_code = 200;
    result.data = app.getMeta();
    return result;
}

std::map<Signal, CALLBACK> observers_;
void setObserver(Signal sig, CALLBACK func) {
    observers_[sig] = func;
}

template<typename T>
void emit(Signal sig, std::shared_ptr<T> data) {
    auto func = observers_[sig];
    if (func == nullptr) return;

    static std::shared_ptr<T> cached_data;
    cached_data = data;
    func(data.get());
}

int generateRandomError(int* error) {
    static int i = 100;
    i++;
    if (i%3==0) {
        auto data = std::make_shared<SignalAData>();
        data->data1 = i;
        data->data2 = 3;
        emit(kSignalA, data);
    }
    else if (i%4==0) {
        emit(kSignalB, std::make_shared<SignalBData>(i));
    }
    (*error) = i;
    return i;
}