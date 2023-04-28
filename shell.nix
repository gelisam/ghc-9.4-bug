with import <nixpkgs> { };
mkShell {
  buildInputs = [
    cabal-install
    #haskell-language-server
    haskell.compiler.ghc94
    #haskell.compiler.ghc924
    #haskell.compiler.ghc902
    #haskell.compiler.ghc810
    #haskellPackages.hasktags
    #haskellPackages.retrie
    ghcid
  ];
}
