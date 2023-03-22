module API.Tools.Types where
import Data.Text (Text)
import GHC.Generics
import Data.Aeson
import Servant

{- This module contains the types for the endpoints in the /tools/* namespace.
 * POST /tools/* - Useful utilities such as cryptocurrency and fiat price conversions.
  * POST JSON body /tools/price-conversion - Endpoint to convert a cryptocurrency amount to a fiat or cryptocurrency amount.
-}

data PriceConversionRequest = PriceConversionRequest
  { pcreq'amount :: Double -- ^ Amount to convert
  , pcreq'from   :: Text   -- ^ Currency symbol of the original amount
  , pcreq'to     :: Text   -- ^ Currency symbol of the converted amount
  } deriving (Show, Generic, ToJSON, FromJSON)

data PriceConversionResponse = PriceConversionResponse
  { pcres'amount :: Double -- ^ Converted amount
  , pcres'from   :: Text   -- ^ Currency symbol of the original amount
  , pcres'to     :: Text   -- ^ Currency symbol of the converted amount
  } deriving (Show, Generic, ToJSON, FromJSON)

-- | Servant type for /tools/price-conversion
type PriceConversionAPI = "tools" :> "price-conversion" :> ReqBody '[JSON] PriceConversionRequest :> Post '[JSON] PriceConversionResponse

-- | Servant type for /tools/*
type ToolsAPI = PriceConversionAPI