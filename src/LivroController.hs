
{-# LANGUAGE OverloadedStrings #-}

module LivroController where

import Database.SQLite.Simple
import Livro

-- CREATE: cadastrar livro
cadastrarLivro :: Livro -> IO ()
cadastrarLivro (Livro _ t a g an) = do
    conn <- open "database/biblioteca.db"

    execute conn
        "INSERT INTO livros (titulo, autor, genero, ano) VALUES (?, ?, ?, ?)"
        (t, a, g, an)

    close conn

-- READ: listar livros
listarLivros :: IO [Livro]
listarLivros = do
    conn <- open "database/biblioteca.db"

    livros <- query_ conn
        "SELECT id, titulo, autor, genero, ano FROM livros"

    close conn

    return livros

-- UPDATE: atualizar livro
atualizarLivro :: Int -> Livro -> IO ()
atualizarLivro id (Livro _ t a g an) = do
    conn <- open "database/biblioteca.db"

    execute conn
        "UPDATE livros SET titulo = ?, autor = ?, genero = ?, ano = ? WHERE id = ?"
        (t, a, g, an, id)

    close conn

-- DELETE: excluir livro
excluirLivro :: Int -> IO ()
excluirLivro id = do
    conn <- open "database/biblioteca.db"

    execute conn
        "DELETE FROM livros WHERE id = ?"
        (Only id)

    close conn
