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

    if (writePolicyList is List == false) {
      Fiber.abort("Expected 'List' for 'writePolicyList' parameter; got %(writePolicyList.type).")
    }

    if (writePolicyList.count == 0) {
      Fiber.abort("One or more write policy instances are required to create a composite write policy.")
    }

    for (policy in writePolicyList) {
      if (policy is WritePolicy == false) {
        Fiber.abort("Invalid type for WritePolicy: %(policy.type)")
      }
    }

    _writePolicies = writePolicyList

  }


  write (options) {

    for (policy in _writePolicies) {
      policy.write(options)
    }

  }


}
