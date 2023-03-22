{-# LANGUAGE ImpredicativeTypes #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}

module API.Currency.Types where

{- This module contains the types for the endpoints in the /currency/* namespace.
* GET /currency/* - Endpoints that return data around cryptocurrencies such as ordered currency lists or price and volume data.
 * GET /currency/metadata - Endpoint to return metadata about all cryptocurrencies. This includes the name, symbol, logo, description, links, and more.
 * GET /currency/metadata/#ticker - Endpoint to return metadata about a currency. This includes the name, symbol, logo, description, links, and more.
 * GET /currency/latest - Returns latest market data for all cryptocurrencies.
 * GET /currency/latest/#ticker - Returns latest market data for a specific cryptocurrency.
-}

import Servant  ( type (:<|>), Capture, JSON, type (:>), Get, IsElem', Elem, IsMember, Proxy(..) )
import Data.Aeson   ( FromJSON, ToJSON )
import GHC.Generics ( Generic )
import Data.Text    ( Text )
import Data.Type.Equality ( type (==) )
import Data.Kind (Type)
import GHC.TypeLits
import Data.Data

-- | Return type for /currency/metadata
data Metadata (symbol :: Symbol) = Metadata
  { cm'name        :: Text   -- ^ Cryptocurrency name
  , cm'logo        :: Text   -- ^ Cryptocurrency logo
  , cm'description :: Text   -- ^ Cryptocurrency description
  } deriving (Eq, Show, Generic, ToJSON, FromJSON)

-- | Return type for /currency/latest
data MarketData (symbol :: Symbol) = MarketData
  { md'price            :: Double -- ^ Price of the cryptocurrency in USD
  , md'volume           :: Double -- ^ Volume of the cryptocurrency in USD
  , md'marketCap        :: Double -- ^ Market cap of the cryptocurrency in USD
  , md'percentChange1h  :: Double -- ^ Percent change in the last hour
  , md'percentChange24h :: Double -- ^ Percent change in the last 24 hours
  , md'percentChange7d  :: Double -- ^ Percent change in the last 7 days
  , md'lastUpdated      :: Text   -- ^ Last updated timestamp
  } deriving (Eq, Show, Generic, ToJSON, FromJSON)

-- | Servant type for /currency/metadata
type CurrencyMetadataAPI = "currency" :> "metadata" :> Servant.Get '[Servant.JSON] [forall currency. Metadata currency]

-- | Servant type for /currency/metadata/#ticker
type CurrencyMetadataTickerAPI = forall currency. "currency" :> "metadata" :> Capture "ticker" Text :> Servant.Get '[Servant.JSON] (Metadata currency)

-- | Servant type for /currency/latest
type CurrencyLatestAPI = "currency" :> "latest" :> Servant.Get '[Servant.JSON] [forall currency. MarketData currency]

-- | Servant type for /currency/latest/#ticker
type CurrencyLatestTickerAPI = forall currency. "currency" :> "latest" :> Capture "ticker" Text :> Servant.Get '[Servant.JSON] (MarketData currency)

-- | Servant type for /currency/*
type CurrencyAPI = CurrencyMetadataAPI :<|> CurrencyMetadataTickerAPI :<|> CurrencyLatestAPI :<|> CurrencyLatestTickerAPI





type SupportedCurrencies = '["BTC", "ETH"] :: [Symbol]

type IsSupportedCurrency symbol = IsMember symbol SupportedCurrencies