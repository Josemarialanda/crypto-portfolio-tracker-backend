module API.Currency.Types where

import Data.Text (Text)

newtype Currency = Currency { unCurrency :: Text } -- ^ Cryptocurrency ticker symbol
  deriving (Eq, Show)

data Metadata = Metadata
  { cm'name        :: Text   -- ^ Cryptocurrency name
  , cm'logo        :: Text   -- ^ Cryptocurrency logo
  , cm'description :: Text   -- ^ Cryptocurrency description
  } deriving (Eq, Show)

data MarketData = MarketData
  { md'price            :: Double -- ^ Price of the cryptocurrency in USD
  , md'volume           :: Double -- ^ Volume of the cryptocurrency in USD
  , md'marketCap        :: Double -- ^ Market cap of the cryptocurrency in USD
  , md'percentChange1h  :: Double -- ^ Percent change in the last hour
  , md'percentChange24h :: Double -- ^ Percent change in the last 24 hours
  , md'percentChange7d  :: Double -- ^ Percent change in the last 7 days
  , md'lastUpdated      :: Text   -- ^ Last updated timestamp
  } deriving (Eq, Show)