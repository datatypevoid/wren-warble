/*
 * Structures
 */

class Logger {


  /*
   * Methods
   */

  construct new (filterPolicy, formatPolicy, writePolicy) {
    _filterPolicy = filterPolicy
    _formatPolicy = formatPolicy
    _writePolicy = writePolicy
  }


  log () {
    log("")
  }


  log (options) {

    if (options is Map == false) {
      options = {
        "format": "%(options)"
      }
    }

    if (options["format"] == null) {
      options = {
        "format": "%(options)"
      }
    }

    if (_filterPolicy.filter(options)) return

    _formatPolicy.format(options)

    _writePolicy.write(options)

  }


  log (format, options) {

    options["format"] = format

    log(options)

  }


  log (channel, format, options) {

    options["channel"] = channel
    options["format"] = format

    log(options)

  }


}
