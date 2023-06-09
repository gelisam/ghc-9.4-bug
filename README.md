This repo provides a minimal repro case for a ghc bug.

The bug is clearly a regression in ghc, because the code compiles with older
versions of ghc and then ghc's behaviour degrades over time.

<table>
  <tr><th>version</th><th>behaviour</th></tr>
  <tr><td>ghc-8.10</td><td>succeeds</td></tr>
  <tr><td>ghc-9.0</td><td>Iface message yet succeeds</td></tr>
  <tr><td>ghc-9.2</td><td>Iface message yet succeeds</td></tr>
  <tr><td>ghc-9.4</td><td>Iface message then interface file error</td></tr>
</table>

## ghc-8.10

```
$ ghc --version
The Glorious Glasgow Haskell Compilation System, version 8.10.7

$ cabal build
[...]
[1 of 2] Compiling MyModule [...]
[2 of 2] Compiling Foo [...]
[exit code 0]
```

## ghc-9.0

```
$ ghc --version
The Glorious Glasgow Haskell Compilation System, version 9.0.2

$ cabal build
[...]
[1 of 2] Compiling MyModule [...]
[2 of 2] Compiling Foo [...]
typecheckIface
Declaration for $fMyClassTYPEMyMaybe
Unfolding of $fMyClassTYPEMyMaybe:
  Iface type variable out of scope:  k
[exit code 0]
```

## ghc-9.2

```
$ ghc --version
The Glorious Glasgow Haskell Compilation System, version 9.2.4

$ cabal build
[...]
[1 of 2] Compiling MyModule [...]
[2 of 2] Compiling Foo [...]
typecheckIface
Declaration for $fMyClassTYPEMyMaybe
Unfolding of $fMyClassTYPEMyMaybe:
  Iface type variable out of scope:  k
[exit code 0]
```

## ghc-9.4

```
$ ghc --version
The Glorious Glasgow Haskell Compilation System, version 9.4.2

$ cabal build
[...]
[1 of 2] Compiling MyModule [...]
[2 of 2] Compiling Foo [...]
typecheckIface
Declaration for $fMyClassTYPEMyMaybe
Unfolding of $fMyClassTYPEMyMaybe:
  Iface type variable out of scope:  k

<no location info>: error:
    Cannot continue after interface file error
[exit code 1]
```
