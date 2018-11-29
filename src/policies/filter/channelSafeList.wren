/*
 * Imports
 */

import "../../filterPolicy" for FilterPolicy


/*
 * Structures
 */

class ChannelSafeListFilterPolicy is FilterPolicy {


  /*
   * Methods
   */

  construct new (safeList) {

    if (safeList is List == false) {
      Fiber.abort("Expected 'List' for 'safeList' parameter; got %(safeList.type).")
    }

    _safeList = safeList

  }


  filter (options) {
    return _safeList.contains(options["channel"]) == false
  }


}
