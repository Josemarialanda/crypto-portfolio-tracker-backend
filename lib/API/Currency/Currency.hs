{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module API.Currency.Currency where

import Servant
import API.Currency.Types
import GHC.TypeLits
import qualified Data.Text as Text
import Data.Text (Text)

currencyMetadataHandler :: forall currency. KnownSymbol currency => Handler [Metadata currency]
currencyMetadataHandler = return mockResponse 
  where
  ticker = symbolVal (Proxy :: Proxy currency)
  mockResponse = [
    Metadata 
      { cm'name = "Bitcoin (" <> Text.pack ticker <> ")"
      , cm'logo = "https://s2.coinmarketcap.com/static/img/coins/64x64/1.png"
      , cm'description = "Bitcoin is a decentralized digital currency, without a \
                        \ central bank or single administrator, \
                        \ that can be sent from user to user on the \
                        \ peer-to-peer bitcoin network without \
                        \ the need for intermediaries." 
      }
      , 
    Metadata 
      { cm'name = "Ethereum (" <> Text.pack ticker <> ")"
      , cm'logo = "https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png"
      , cm'description = "Ethereum is a decentralized platform that runs \
                        \ smart contracts: applications that run exactly \
                        \ as programmed without any possibility of \
                        \ downtime, censorship, fraud or third-party \
                        \ interference." 
      }
      , 
    Metadata 
      { cm'name = "Ripple (" <> Text.pack ticker <> ")"
      , cm'logo = "https://s2.coinmarketcap.com/static/img/coins/64x64/52.png"
      , cm'description = "Ripple is an open-source, distributed \
                        \ payment protocol that enables \
                        \ financial institutions to \
                        \ settle cross-border payments in \
                        \ real time, with end-to-end \
                        \ transparency and low \
                        \ transaction costs."
      }
      , 
    Metadata
      { cm'name = "Solana (" <> Text.pack ticker <> ")"
      , cm'logo = "https://s2.coinmarketcap.com/static/img/coins/64x64/5426.png"
      , cm'description = "Solana is a decentralized, high-performance, \
                        \ open-source blockchain that is \
                        \ designed to enable fast, \
                        \ secure, and scalable \
                        \ transactions."
      }
    ]

currencyMetadataTickerHandler :: forall currency. KnownSymbol currency => Text -> Handler (Metadata currency)
currencyMetadataTickerHandler currency = return mockResponse 
  where
  ticker = symbolVal (Proxy :: Proxy currency)
  mockResponse = Metadata 
      { cm'name = "Bitcoin (" <> Text.pack ticker <> ")"
      , cm'logo = "https://s2.coinmarketcap.com/static/img/coins/64x64/1.png"
      , cm'description = "Bitcoin is a decentralized digital currency, without a \
                        \ central bank or single administrator, \
                        \ that can be sent from user to user on the \
                        \ peer-to-peer bitcoin network without \
                        \ the need for intermediaries." 
      }

currencyLatestHandler :: forall currency. Handler [MarketData currency]
currencyLatestHandler = return mockResponse 
  where
  mockResponse = [
    MarketData 
      { md'price = 1.0
      , md'volume = 1.0
      , md'marketCap = 1.0
      , md'percentChange1h = 1.0
      , md'percentChange24h = 1.0
      , md'percentChange7d = 1.0
      , md'lastUpdated = "1d"
      }
      ,
    MarketData 
      { md'price = 2.0
      , md'volume = 2.0
      , md'marketCap = 2.0
      , md'percentChange1h = 2.0
      , md'percentChange24h = 2.0
      , md'percentChange7d = 2.0
      , md'lastUpdated = "1d"
      }
      ,
    MarketData 
      { md'price = 3.0
      , md'volume = 3.0
      , md'marketCap = 3.0
      , md'percentChange1h = 3.0
      , md'percentChange24h = 3.0
      , md'percentChange7d = 3.0
      , md'lastUpdated = "1d"
      }
      ,
    MarketData 
      { md'price = 4.0
      , md'volume = 4.0
      , md'marketCap = 4.0
      , md'percentChange1h = 4.0
      , md'percentChange24h = 4.0
      , md'percentChange7d = 4.0
      , md'lastUpdated = "1d"
      }
    ]

currencyLatestTickerHandler :: forall currency. Text -> Handler (MarketData currency)
currencyLatestTickerHandler currency = return mockResponse 
  where
  mockResponse = undefined