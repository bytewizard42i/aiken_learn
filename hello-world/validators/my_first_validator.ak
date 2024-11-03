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
