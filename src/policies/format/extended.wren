/*
 * Imports
 */

import "../../formatPolicy" for FormatPolicy


/*
 * Structures
 */

class ExtendedFormatPolicy is FormatPolicy {


  /*
   * Methods
   */

  construct new () {}


  format (options) {

    var channel = options["channel"] || null
    var format = options["format"] || null
    var subchannel = options["subchannel"] || null

    options["format"] = "%(channel ? "[%(channel)" : "")" +
      "%(channel ? (subchannel ? ":" : "") : "")" +
      "%(subchannel ? (channel ? "%(subchannel)" : "[%(subchannel)") : "")" +
      "%(channel || subchannel ? "] " : "")" +
      "%(format ? format : "")"

  }


}
