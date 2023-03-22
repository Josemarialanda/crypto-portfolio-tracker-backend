{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Utils.Utils where

import API.Currency.Types ( IsSupportedCurrency )
import Data.Proxy (Proxy(..))
import GHC.TypeLits (KnownSymbol, symbolVal)

-- Print the symbol of a currency type (e.g. "BTC") given a proxy for the currency type (e.g. Proxy :: Proxy "BTC")
currencySymbol :: forall currency. (KnownSymbol currency, IsSupportedCurrency currency) => Proxy currency -> String
currencySymbol _ = symbolVal (Proxy :: Proxy currency)