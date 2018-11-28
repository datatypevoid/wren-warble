/*
 * Imports
 */

import "../../filterPolicy" for FilterPolicy


/*
 * Structures
 */

class CompositeFilterPolicy is FilterPolicy {


  /*
   * Methods
   */

  construct new (filterPolicyList) {

    if (filterPolicyList is List == null) {
      Fiber.abort("Expected 'List' for 'filterPolicyList' parameter; got $(filterPolicyList.type).")
    }

    if (filterPolicyList.count == 0) {
      Fiber.abort("One or more filter policy instances are required to create a composite filter policy.")
    }

    _filterPolicies = filterPolicyList

  }


  filter (options) {

    for (policy in _filterPolicies) {
      if (policy.filter(options)) return true
    }

    return false

  }


}
