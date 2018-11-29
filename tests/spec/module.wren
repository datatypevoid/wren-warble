/*
 * Imports
 */

import "../../wren_modules/wren-test/dist/module" for ConsoleReporter

// Test suites.
import "./logger" for LoggerTest
import "./policies/filter/channelBlockList" for ChannelBlockListFilterPolicyTest
import "./policies/filter/channelSafeList" for ChannelSafeListFilterPolicyTest
import "./policies/filter/composite" for CompositeFilterPolicyTest
import "./policies/filter/noFilter" for NoFilterPolicyTest
import "./policies/filter/verbosity" for VerbosityPolicyTest
import "./policies/format/ansi" for ANSIFormatPolicyTest
import "./policies/format/composite" for CompositeFormatPolicyTest
import "./policies/format/extended" for ExtendedFormatPolicyTest
import "./policies/format/simple" for SimpleFormatPolicyTest
import "./policies/write/composite" for CompositeWritePolicyTest
import "./policies/write/console" for ConsoleWritePolicyTest


/*
 * Constants
 */

// Store test suites in List.
var TESTS = [
  ChannelBlockListFilterPolicyTest,
  ChannelSafeListFilterPolicyTest,
  CompositeFilterPolicyTest,
  LoggerTest,
  NoFilterPolicyTest,
  VerbosityPolicyTest,
  ANSIFormatPolicyTest,
  CompositeFormatPolicyTest,
  ExtendedFormatPolicyTest,
  SimpleFormatPolicyTest,
  CompositeWritePolicyTest,
  ConsoleWritePolicyTest
]

var reporter = ConsoleReporter.new()


/*
 * Script Execution
 */

for (test in TESTS) test.run(reporter)
