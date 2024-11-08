use aiken/collection/list
use aiken/crypto.{VerificationKeyHash}
use cardano/transaction.{OutputReference, Transaction}

pub type Datum {
  owner: VerificationKeyHash,
}

pub type Redeemer {
  msg: ByteArray,
}

validator hello_world {
  spend(
    datum: Option<Datum>,
    redeemer: Redeemer,
    _own_ref: OutputReference,
    self: Transaction,
  ) {
    expect Some(Datum { owner }) = datum
    let must_say_hello = redeemer.msg == "Hello, World!"
    let must_be_signed = list.has(self.extra_signatories, owner)
    must_say_hello && must_be_signed
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
