{-# LANGUAGE TypeApplications #-}
module ModuleC where

import Data.Functor.Identity
import qualified Barbies

import ModuleAB


foo :: IO (TypeB Identity)
foo = Barbies.btraverseC @Eq undefined undefined
