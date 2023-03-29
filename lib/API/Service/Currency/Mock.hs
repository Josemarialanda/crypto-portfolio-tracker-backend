{-# LANGUAGE OverloadedStrings #-}

module API.Service.Currency.Mock where

import API.Service.Currency.Types ( Metadata(..), MarketData(..) )
import qualified Data.Text as Text
import GHC.TypeLits (KnownSymbol)

mockMetadata :: [Metadata]
mockMetadata = [
  Metadata 
    { cm'ticker = "BTC"
    , cm'name = "Bitcoin"
    , cm'logo = "https://s2.coinmarketcap.com/static/img/coins/64x64/1.png"
    , cm'description = "Bitcoin is a decentralized digital currency, without a \
                      \ central bank or single administrator, \
                      \ that can be sent from user to user on the \
                      \ peer-to-peer bitcoin network without \
                      \ the need for intermediaries." 
    },  
  Metadata 
    { cm'ticker = "ETH"
    , cm'name = "Ethereum"
    , cm'logo = "https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png"
    , cm'description = "Ethereum is a decentralized platform that runs \
                      \ smart contracts: applications that run exactly \
                      \ as programmed without any possibility of \
                      \ downtime, censorship, fraud or third-party \
                      \ interference." 
    }, 
  Metadata 
    { cm'ticker = "XRP"
    , cm'name = "Ripple"
    , cm'logo = "https://s2.coinmarketcap.com/static/img/coins/64x64/52.png"
    , cm'description = "Ripple is an open-source, distributed \
                      \ payment protocol that enables \
                      \ financial institutions to \
                      \ settle cross-border payments in \
                      \ real time, with end-to-end \
                      \ transparency and low \
                      \ transaction costs."
    }, 
  Metadata
    { cm'ticker = "SOL"
    , cm'name = "Solana"
    , cm'logo = "https://s2.coinmarketcap.com/static/img/coins/64x64/5426.png"
    , cm'description = "Solana is a decentralized, high-performance, \
                      \ open-source blockchain that is \
                      \ designed to enable fast, \
                      \ secure, and scalable \
                      \ transactions."
    }
  ]

mockMarketData :: [MarketData]
mockMarketData = [
  MarketData
    { md'ticker = "BTC"
    , md'price = 1.0
    , md'volume = 1.0
    , md'marketCap = 1.0
    , md'percentChange1h = 1.0
    , md'percentChange24h = 1.0
    , md'percentChange7d = 1.0
    , md'lastUpdated = "1d"
    },
  MarketData 
    { md'ticker = "ETH"
    , md'price = 2.0
    , md'volume = 2.0
    , md'marketCap = 2.0
    , md'percentChange1h = 2.0
    , md'percentChange24h = 2.0
    , md'percentChange7d = 2.0
    , md'lastUpdated = "1d"
    },
  MarketData 
    { md'ticker = "XRP"
    , md'price = 3.0
    , md'volume = 3.0
    , md'marketCap = 3.0
    , md'percentChange1h = 3.0
    , md'percentChange24h = 3.0
    , md'percentChange7d = 3.0
    , md'lastUpdated = "1d"
    },
  MarketData 
    { md'ticker = "SOL"
    , md'price = 4.0
    , md'volume = 4.0
    , md'marketCap = 4.0
    , md'percentChange1h = 4.0
    , md'percentChange24h = 4.0
    , md'percentChange7d = 4.0
    , md'lastUpdated = "1d"
    }
  ]