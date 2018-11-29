/*
 * Imports
 */

import "../../writePolicy" for WritePolicy


/*
 * Structures
 */

class ConsoleWritePolicy is WritePolicy {


  /*
   * Methods
   */

  construct new (writeFn) {
    _writeFn = writeFn
  }


  construct new () {
    _writeFn = Fn.new { |input|
      System.print(input)
    }
  }


  write (options) {
    _writeFn.call(options["format"] || "")
  }


}
