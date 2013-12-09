gem-checksum
============

## Adds `gem checksum` command.

Still in development, but works.  See [RubyGems security guide](http://guides.rubygems.org/security/)

## Usage

```sh
gem help checksum
```

```plain
Usage: gem checksum GEM_NAME [options]

  Options:
        --compare-to                 Boolean compare to the generated checksum
        --checksum-folder            Folder to write generated checksum to


  Arguments:
    GEM_NAME           the name of the gem you wish to hash

  Summary:
    Calculate the checksum for a gem

  Description:
    Calculates the checksum for a gem
```

## Examples

```sh
$ gem checksum pkg/gem-checksum-0.0.1.gem
bf1c5e6ad6a5e3c1ea736dcc1e7ca1284cfc6e195c7fa7e9c1b5ccebf25411de2122476f27694a52ef4a04aae2a62bd5735ce60817ed087177398c2bbe8e2351
```

```sh
gem checksum pkg/gem-checksum-0.0.1.gem --compare-to bf1c5e6ad6a5e3c1ea736dcc1e7ca1284cfc6e195c7fa7e9c1b5ccebf25411de2122476f27694a52ef4a04aae2a62bd5735ce60817ed087177398c2bbe8e2351
bf1c5e6ad6a5e3c1ea736dcc1e7ca1284cfc6e195c7fa7e9c1b5ccebf25411de2122476f27694a52ef4a04aae2a62bd5735ce60817ed087177398c2bbe8e2351
Checksum validated
```

```sh
gem checksum pkg/gem-checksum-0.0.1.gem --compare-to thatcantberight
bf1c5e6ad6a5e3c1ea736dcc1e7ca1284cfc6e195c7fa7e9c1b5ccebf25411de2122476f27694a52ef4a04aae2a62bd5735ce60817ed087177398c2bbe8e2351
Calculated checksum not equal to given checksum:
Expected:       thatcantberight
Calculcated:    bf1c5e6ad6a5e3c1ea736dcc1e7ca1284cfc6e195c7fa7e9c1b5ccebf25411de2122476f27694a52ef4a04aae2a62bd5735ce60817ed087177398c2bbe8e2351
```

```sh
gem checksum pkg/gem-checksum-0.0.1.gem --checksum-folder checksum
bf1c5e6ad6a5e3c1ea736dcc1e7ca1284cfc6e195c7fa7e9c1b5ccebf25411de2122476f27694a52ef4a04aae2a62bd5735ce60817ed087177398c2bbe8e2351
Wrote checksum to checksum/gem-checksum-0.0.1.gem.sha512
```
