validator my_first_validator {
  spend(
    _datum: Option<Data>,
    _redeemer: Data,
    _output_reference: Data,
    _context: Data,
  ) {
    True
  }

  else(_) {
    fail
  }
}
// Alice generated code diagram
//   User --------> Sends ADA to Validator Address -------------> UTxO Created at Address
//                                    |
//                                    |
//                            Validator Hash
//                   c47a3e1d87f9b46e3f3e7a97c934c5a8a0f1a073d0e9d4f0bf1ea4a1e6e2a67a
//                                    |
//                                    |
//   Transaction -----------------> Calls `spend` function ------------------> ADA Unlocked
//                          (provides `_datum`, `_redeemer`, `_output_reference`, `_context`)
