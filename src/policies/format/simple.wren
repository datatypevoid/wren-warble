/*
 * Imports
 */

import "../../formatPolicy" for FormatPolicy


/*
 * Structures
 */

class SimpleFormatPolicy is FormatPolicy {


  /*
   * Methods
   */

  construct new () {}


  format (options) {
    options["format"] = "%(options["format"] ? options["format"] : "")"
  }


}
