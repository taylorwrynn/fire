/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#ifndef log_h
#define log_h

#define TXLog(fmt, ...) NSLog((@"%s [Line %d] %@" fmt), __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread], ##__VA_ARGS__)
#ifdef metamacro_foreach
#define TXLogVars(...) metamacro_foreach(TXLogIterItem,, __VA_ARGS__)
#define TXLogIterItem(INDEX, VAR) TXLog(@"%s: %@", #VAR, (VAR));
#else
#define TXLogVars(...)
#endif

#if !defined(Dlog) && !defined(Dlogvars)
#ifdef DEBUG
#define Dlog(fmt, ...)     TXLog(fmt, __VA_ARGS__)
#define Dlogvars(...) TXLogVars(__VA_ARGS__)
#else
#define Dlog(fmt, ...)
#define Dlogvars(...)
#endif
#endif

#endif /* log_h */
