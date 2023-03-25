{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ImpredicativeTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}

module API.Servant.Currency.Currency where

import Servant ( Handler )
import API.Servant.Currency.Types ( Metadata, MarketData )
import qualified Data.Text as Text
import Data.Text (Text)
import API.Servant.Currency.Mock (mockMetadata, mockMarketData)

currencyMetadataHandler :: Handler [Metadata]
currencyMetadataHandler = return mockMetadata

currencyMetadataTickerHandler :: Text -> Handler Metadata
currencyMetadataTickerHandler currency = return $ head mockMetadata

currencyLatestHandler :: Handler [MarketData]
currencyLatestHandler = return mockMarketData

currencyLatestTickerHandler :: Text -> Handler MarketData
currencyLatestTickerHandler currency = return $ head mockMarketData 