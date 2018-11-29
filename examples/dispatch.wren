/*
 * Imports
 */

import "../src/logger" for Logger
import "../src/policies/filter/channelBlockList" for ChannelBlockListFilterPolicy
import "../src/policies/filter/channelSafeList" for ChannelSafeListFilterPolicy
import "../src/policies/filter/noFilter" for NoFilterPolicy
import "../src/policies/filter/verbosity" for VerbosityFilterPolicy
import "../src/policies/format/ansi/color" for ANSIBackgroundColor, ANSIForegroundColor, ANSIStyle
import "../src/policies/format/ansi/module" for ANSIFormatPolicy
import "../src/policies/format/composite" for CompositeFormatPolicy
import "../src/policies/format/extended" for ExtendedFormatPolicy
import "../src/policies/format/simple" for SimpleFormatPolicy
import "../src/policies/write/console" for ConsoleWritePolicy


/*
 * Structures
 */

class LogType {
  static Assert { "Assert" }
  static Debug { "Debug" }
  static Error { "Error" }
  static Fatal { "Fatal" }
  static Info { "Info" }
  static Warn { "Warn" }
}


class Dispatch {


  /*
   * Methods
   */

  static provide (logger) {

    __loggers = __loggers || []

    __loggers.add(logger)

  }


  static log (channel, subchannel, verbosity, format, vargs) {

    for (logger in __loggers) {
      logger.log({
        "channel": channel,
        "format": format,
        "subchannel": subchannel,
        "verbosity": verbosity,
        "vargs": vargs
      })
    }

  }


  static log (channel, subchannel, verbosity, format) {

    for (logger in __loggers) {

      logger.log({
        "channel": channel,
        "format": format,
        "subchannel": subchannel,
        "verbosity": verbosity
      })

    }

  }


  static debug () {
    Dispatch.log(LogType.Debug, null, 0, "")
  }

  static debug (format) {
    Dispatch.log(LogType.Debug, null, 0, format)
  }

  static debug (subchannel, format) {
    Dispatch.log(LogType.Debug, subchannel, 0, format)
  }

  static debug (subchannel, verbosity, format) {
    Dispatch.log(LogType.Debug, subchannel, verbosity, format)
  }


  static error () {
    Dispatch.log(LogType.Error, null, 0, "")
  }

  static error (format) {
    Dispatch.log(LogType.Error, null, 0, format)
  }

  static error (subchannel, format) {
    Dispatch.log(LogType.Error, subchannel, 0, format)
  }

  static error (subchannel, verbosity, format) {
    Dispatch.log(LogType.Error, subchannel, verbosity, format)
  }


  static fatal () {
    Dispatch.log(LogType.Fatal, null, 0, "")
  }

  static fatal (format) {
    Dispatch.log(LogType.Fatal, null, 0, format)
  }

  static fatal (subchannel, format) {
    Dispatch.log(LogType.Fatal, subchannel, 0, format)
  }

  static fatal (subchannel, verbosity, format) {
    Dispatch.log(LogType.Fatal, subchannel, verbosity, format)
  }


  static info () {
    Dispatch.log(LogType.Info, null, 0, "")
  }

  static info (format) {
    Dispatch.log(LogType.Info, null, 0, format)
  }

  static info (subchannel, format) {
    Dispatch.log(LogType.Info, subchannel, 0, format)
  }

  static info (subchannel, verbosity, format) {
    Dispatch.log(LogType.Info, subchannel, verbosity, format)
  }


  static warn () {
    Dispatch.log(LogType.Warn, null, 0, "")
  }

  static warn (format) {
    Dispatch.log(LogType.Warn, null, 0, format)
  }

  static warn (subchannel, format) {
    Dispatch.log(LogType.Warn, subchannel, 0, format)
  }

  static warn (subchannel, verbosity, format) {
    Dispatch.log(LogType.Warn, subchannel, verbosity, format)
  }


}


/*
 * Script
 */

Dispatch.provide(
  Logger.new(
    ChannelSafeListFilterPolicy.new(["Info"]),
    CompositeFormatPolicy.new([
      SimpleFormatPolicy.new(),
      ANSIFormatPolicy.new(ANSIForegroundColor.Magenta)
    ]),
    ConsoleWritePolicy.new()
  )
)

Dispatch.provide(
  Logger.new(
    ChannelBlockListFilterPolicy.new(["Error", "Fatal", "Warn"]),
    CompositeFormatPolicy.new([
      ExtendedFormatPolicy.new(),
      ANSIFormatPolicy.new(ANSIForegroundColor.Cyan)
    ]),
    ConsoleWritePolicy.new()
  )
)

Dispatch.provide(
  Logger.new(
    ChannelSafeListFilterPolicy.new(["Error", "Fatal"]),
    CompositeFormatPolicy.new([
      ExtendedFormatPolicy.new(),
      ANSIFormatPolicy.new(ANSIForegroundColor.Red, ANSIBackgroundColor.White)
    ]),
    ConsoleWritePolicy.new()
  )
)

Dispatch.provide(
  Logger.new(
    VerbosityFilterPolicy.new(3),
    CompositeFormatPolicy.new([
      ExtendedFormatPolicy.new(),
      ANSIFormatPolicy.new(ANSIForegroundColor.Blue, ANSIBackgroundColor.Black, ANSIStyle.Underline)
    ]),
    ConsoleWritePolicy.new()
  )
)


Dispatch.debug("Hello world!")
Dispatch.error("Cap'n the ship is sinking!")
Dispatch.warn("engine", 3, "failing!")
Dispatch.fatal("crash", "All hands abandon ship!")
Dispatch.info("Ship destroyed.")
