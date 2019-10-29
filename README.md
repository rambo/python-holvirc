# python-holvirc

Drive [Holvi][holvi] API via Python. Unlike [holviapi] this uses your
username and password for login so you do not need to to beg Holvi for a
special API-key.

[holvi]: https://about.holvi.com/en/
[holviapi]: https://github.com/rambo/python-holviapi

## Broken at the moment

MFA enforcement broke everything there is a way to work around that
by using [TOTP library][pyotp], but there are details I'm waiting to get
from an insider to help me get this done without spending tons of time
black-box reverse engineering *everything*.

[pyotp]: https://pyotp.readthedocs.io/en/latest/

## NOTE

  1. This uses combination of reverse-engineered APIs, when something 
  changes in Holvis end this will probably break.
  2. If you use the default login method Holvi knows you are using this
  library, this should be a good thing so they can inform you about
  upcoming breaking changes.

## How to use

Since writing documentation is boring I suggest you look at the tests
here and in [holviapi] they should give a decent idea.
