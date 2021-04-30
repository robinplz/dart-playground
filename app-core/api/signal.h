#ifndef _SIGNAL_H_
#define _SIGNAL_H_

typedef enum {
    kSignalA = 1,
    kSignalB = 2,
} Signal;

typedef struct _SignalAData {
    int data1;
    int data2;
} SignalAData;

typedef int SignalBData;

// example of a callback function:
// - void onUpdate(void* data);
typedef void(*CALLBACK)(void*);

#endif /* _SIGNAL_H_ */
