
{-# LANGUAGE DeriveGeneric #-}

module Livro where

import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow
import Database.SQLite.Simple.ToRow

data Livro = Livro {
    idLivro :: Int,
    titulo :: String,
    autor :: String,
    genero :: String,
    ano :: Int
} deriving (Show, Eq)

instance FromRow Livro where
    fromRow = Livro <$> field <*> field <*> field <*> field <*> field

instance ToRow Livro where
    toRow (Livro _ t a g an) = toRow (t, a, g, an)

