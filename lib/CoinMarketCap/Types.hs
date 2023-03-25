{-# LANGUAGE InstanceSigs #-}

module CoinMarketCap.Types
  ( TickerId,
    Ticker,
    Tickers,
    GlobalData,
    FiatSymbol (..),
  )
where

import Data.Aeson (FromJSON, ToJSON)
import Data.Text (Text, pack)
import GHC.Generics (Generic)
import Servant (ToHttpApiData (toQueryParam))

type TickerId = String

data Ticker = Ticker
  { tId :: TickerId,
    tName :: String,
    tSymbol :: String,
    tRank :: String,
    tPriceBtc :: String,
    tPriceUsd :: String,
    tPriceJpy :: Maybe String,
    t24HVolumeUsd :: String,
    tMarketCapUsd :: String,
    tMarketCapJpy :: Maybe String,
    tAvailableSupply :: String,
    tTotalSupply :: String,
    tMaxSupply :: Maybe String,
    tPercentChange1h :: String,
    tPercentChange24h :: String,
    tPercentChange7d :: String,
    tLastUpdated :: String
  }
  deriving (Eq, Show, Generic, ToJSON, FromJSON)

type Tickers = [Ticker]

data GlobalData = GlobalData
  { gTotalMarketCapUsd :: Integer,
    gTotal24hVolumeUsd :: Integer,
    gBitcoinPercentageOfMarketCap :: Float,
    gActiveCurrencies :: Integer,
    gActiveAssets :: Integer,
    gActiveMarkets :: Integer,
    gLastUpdated :: Integer,
    gTotalMarketCapJpy :: Maybe Integer,
    gTotal24hVolumeJpy :: Maybe Integer
  }
  deriving (Eq, Show, Generic, ToJSON, FromJSON)

data FiatSymbol
  = AUD
  | BRL
  | CAD
  | CHF
  | CLP
  | CNY
  | CZK
  | DKK
  | EUR
  | GBP
  | HKD
  | HUF
  | IDR
  | ILS
  | INR
  | JPY
  | KRW
  | MXN
  | MYR
  | NOK
  | NZD
  | PHP
  | PKR
  | PLN
  | RUB
  | SEK
  | SGD
  | THB
  | TRY
  | TWD
  | ZAR
  deriving (Eq, Show, Generic, ToJSON, FromJSON)

instance ToHttpApiData FiatSymbol where
  toQueryParam :: FiatSymbol -> Text
  toQueryParam = pack . show
