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

  construct new () {}


  write (options) {
    System.print(options["format"])
  }


}
