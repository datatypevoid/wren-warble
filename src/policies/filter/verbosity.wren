/*
 * Imports
 */

import "../../filterPolicy" for FilterPolicy


/*
 * Structures
 */

class VerbosityFilterPolicy is FilterPolicy {


  /*
   * Methods
   */

  construct new () {
    _verbosityLevel = 0
  }


  construct new (level) {

    if (level is Num == false || level.isInteger == false) {
      Fiber.abort("Expected 'integer' for 'level' parameter; got %(level.type).")
    }

    _verbosityLevel = level

  }


  filter (options) {

    if (!options["verbosity"]) return false

    return options["verbosity.wren"] > _verbosityLevel

  }


}
