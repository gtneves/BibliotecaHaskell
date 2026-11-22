
{-# LANGUAGE OverloadedStrings #-}

module Database (initializeDatabase) where

import Database.SQLite.Simple

initializeDatabase :: IO ()
initializeDatabase = do
    conn <- open "database/biblioteca.db"

    execute_ conn
        "CREATE TABLE IF NOT EXISTS livros (\
        \id INTEGER PRIMARY KEY AUTOINCREMENT,\
        \titulo TEXT NOT NULL,\
        \autor TEXT NOT NULL,\
        \genero TEXT NOT NULL,\
        \ano INTEGER NOT NULL)"

    close conn
