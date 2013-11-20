//
//  New Relic for Mobile -- iOS edition
//
//  See:
//    https://docs.newrelic.com/docs/mobile-apps for information
//    https://docs.newrelic.com/docs/releases/ios for release notes
//
//  Copyright (c) 2013 New Relic. All rights reserved.
//  See https://docs.newrelic.com/docs/licenses/ios-agent-licenses for license details
//

#import <Foundation/Foundation.h>

#ifndef _NEWRELIC_AGENT_LOGGING_
#define _NEWRELIC_AGENT_LOGGING_

/*************************************/
/**      SDK Internal Logging       **/
/*************************************/

/*******************************************************************************
 * The New Relic agent includes an internal logger called NRLogger to make your
 * life a touch easier when you want to know what's going on under the hood.
 * You can direct various levels of agent activity messages to the device
 * console through NSLog or to a file stored in the app's document directory.
 *
 * Please note that NRLogger does not send any data whatsoever to New Relic's
 * servers. You'll need to have access to the device/simulator console or dig
 * the file out yourself.
 *******************************************************************************/


/*******************************************************************************
 * Log levels used in the agent's internal logger
 *
 * When calling NRLogger setLogLevels: pass in a bitmask of the levels you want
 * enabled, ORed together e.g.
 *   [NRLogger setLogLevels:NRLogLevelError|NRLogLevelWarning|NRLogLevelInfo];
 *
 * NRLogLevelALL is a convenience definition.
 *
 * NRLogger's default log level is NRLogLevelError|NRLogLevelWarning
 *******************************************************************************/

typedef enum _NRLogLevels {
    NRLogLevelNone    = 0,
    NRLogLevelError   = 1 << 0,
    NRLogLevelWarning = 1 << 1,
    NRLogLevelInfo    = 1 << 2,
    NRLogLevelVerbose = 1 << 3,
    NRLogLevelALL     = 0xffff
} NRLogLevels;

typedef enum _NRLogTargets {
    NRLogTargetNone      = 0,
    NRLogTargetConsole   = 1 << 0,
    NRLogTargetFile      = 1 << 1
} NRLogTargets;

#define NRLogMessageLevelKey        @"level"
#define NRLogMessageFileKey         @"file"
#define NRLogMessageLineNumberKey   @"lineNumber"
#define NRLogMessageMethodKey       @"method"
#define NRLogMessageTimestampKey    @"timestamp"
#define NRLogMessageMessageKey      @"message"

/*******************************************************************************
 * Log targets used in the agent's internal logger
 *
 * When calling NRLogger setLogTargets: pass in a bitmask of the targets you
 * want enabled, ORed together e.g.
 *   [NRLogger setLogTargets:NRLogTargetConsole|NRLogTargetFile];
 *
 * NRLogTargetConsole uses NSLog() to output to the device console
 * NRLogTargetFile writes log messages to a file in JSON-format
 * NRLogTargetALL is a convenience definition.
 *
 *NRLogger's default target is NRLogTargetConsole
 *******************************************************************************/

@interface NRLogger : NSObject {
    NSUInteger logLevels;
    NSUInteger logTargets;
    NSFileHandle *logFile;
}

+ (void)log:(NSUInteger)level
     inFile:(NSString *)file
     atLine:(NSUInteger)line
   inMethod:(NSString *)method
withMessage:(NSString *)message;

/*******************************************************************************
 * Configuration for the New Relic Agent's internal logging facilities.
 *
 * Call these at the beginning of your UIApplicationDelegate's
 *   application:didFinishLaunchingWithOptions: method:
 *
 * [NRLogger setLogLevels:NRLogLevelError|NRLogLevelWarning|NRLogLevelInfo];
 * [NRLogger setLogTargets:NRLogTargetConsole|NRLogTargetFile];
 *******************************************************************************/

+ (void)setLogLevels:(NSUInteger)levels;
+ (void)setLogTargets:(NSUInteger)targets;

/*******************************************************************************
 * Returns the path of the file to which the agent is logging.
 * The file contains comma-separated JSON blobs, each blob encapsulating one log message.
 *******************************************************************************/

+ (NSString *)logFilePath;

/*******************************************************************************
 * Truncates the log file used by the agent
 *******************************************************************************/

+ (void)clearLog;

@end


#define NRLOG(level, format, ...) \
    [NRLogger log:level inFile:[[NSString stringWithUTF8String:__FILE__] lastPathComponent] atLine:__LINE__ inMethod:[NSString stringWithUTF8String:__func__] withMessage:[NSString stringWithFormat:format, ##__VA_ARGS__]]

#define NRLOG_ERROR(format, ...) NRLOG(NRLogLevelError, format, ##__VA_ARGS__)
#define NRLOG_WARNING(format, ...) NRLOG(NRLogLevelWarning, format, ##__VA_ARGS__)
#define NRLOG_INFO(format, ...) NRLOG(NRLogLevelInfo, format, ##__VA_ARGS__)
#define NRLOG_VERBOSE(format, ...) NRLOG(NRLogLevelVerbose, format, ##__VA_ARGS__)

#endif
