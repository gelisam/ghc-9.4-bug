{-# LANGUAGE DeriveAnyClass, DeriveGeneric, DerivingStrategies, GeneralizedNewtypeDeriving, UndecidableInstances #-}
module ModuleAB where

import GHC.Generics (Generic)
import qualified Barbies


data TypeA f = CtorA (f ())
  deriving stock (Generic)
  deriving anyclass (Barbies.FunctorB, Barbies.TraversableB, Barbies.ConstraintsB)

newtype TypeB f = CtorB (TypeA f)
  deriving stock (Generic)
  deriving newtype (Barbies.FunctorB, Barbies.ConstraintsB)
instance Barbies.TraversableB TypeB where
