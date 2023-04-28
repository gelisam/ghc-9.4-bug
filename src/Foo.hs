{-# LANGUAGE TypeApplications #-}
module Foo where

import Data.Kind (Type)
import Data.Proxy (Proxy(Proxy))

import MyModule

foo :: ()
foo = myMethod @Type @MyMaybe @() () Proxy Proxy
