/*
 * Imports
 */

import "../../filterPolicy" for FilterPolicy


/*
 * Structures
 */

class ChannelBlockListFilterPolicy is FilterPolicy {


  /*
   * Methods
   */

  construct new (blockList) {

    if (blockList is List == false) {
      Fiber.abort("Expected 'List' for 'blockList' parameter; got %(blockList.type).")
    }

    _blockList = blockList

  }


  filter (options) {
    return _blockList.contains(options["channel"]) == true
  }


}
