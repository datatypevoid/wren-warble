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

    var error
    var fiber

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

    fiber = Fiber.new {

      if (_filterPolicy.filter(options)) return

      _formatPolicy.format(options)

      _writePolicy.write(options)

    }

    error = fiber.try()

    if (error) System.print("Error: logging failure: %(error)")

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
