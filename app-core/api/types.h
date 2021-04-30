#ifndef _TYPES_H_
#define _TYPES_H_

typedef struct {
    char* name;
    int majorVersion;
    int minorVersion;
} AppMeta;

typedef struct {
    int status_code;
    AppMeta data;
} AppMetaResult;

#endif