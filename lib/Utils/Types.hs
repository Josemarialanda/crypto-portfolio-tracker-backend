{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE GADTs #-}

module Utils.Types where

import Data.Kind
  ( Constraint,
    Type,
  )
import Data.Type.Bool
  ( If,
    Not,
  )
import Data.Type.Equality (type (==))
import GHC.TypeLits
  ( ErrorMessage
      ( ShowType,
        Text,
        (:<>:)
      ),
    Symbol,
    TypeError,
  )
import Data.Data (Proxy (Proxy))
import GHC.Generics (Generic)

-- | This type family constraint that checks if a type is a member of a list of types.
type family Member (a :: k) (as :: [k]) errorMsg :: Constraint where
  Member _ '[]       errorMsg = TypeError ('Text errorMsg)
  Member x '[y]      errorMsg = If (x == y) (() :: Constraint) (TypeError ('Text errorMsg))
  Member x (y ': ys) errorMsg = If (Not (x == y)) (Member x ys errorMsg) (() :: Constraint)

-- This GADT to represent a variable list of types.
data OneOf as where
  This :: a -> OneOf (a : as)
  Next :: OneOf as -> OneOf (a : as)

-- This GADT to represent a variable list of types applied to some structure f.
data OneOfF f as where
  ThisF :: f a -> OneOfF f (a : as)
  NextF :: OneOfF f as -> OneOfF f (a : as)