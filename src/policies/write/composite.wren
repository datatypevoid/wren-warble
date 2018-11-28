/*
 * Imports
 */

import "../../writePolicy" for WritePolicy


/*
 * Structures
 */

class CompositeWritePolicy is WritePolicy {


  /*
   * Methods
   */

  construct new (writePolicyList) {

    if (writePolicyList is List == null) {
      Fiber.abort("Expected 'List' for 'writePolicyList' parameter; got $(writePolicyList.type).")
    }

    if (writePolicyList.count == 0) {
      Fiber.abort("One or more write policy instances are required to create a composite write policy.")
    }

    _writePolicies = writePolicyList

  }


  write (options) {

    for (policy in _writePolicies) {
      policy.write(options)
    }

  }


}
