/*
 * Imports
 */

import "../../filterPolicy" for FilterPolicy


/*
 * Structures
 */

class NoFilterPolicy is FilterPolicy {


  /*
   * Methods
   */

  construct new () {}


  filter (options) {
    return false // No filter.
  }


}
