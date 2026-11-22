module Main where

import Database
import Livro
import LivroController

main :: IO ()
main = do
    initializeDatabase

    putStrLn "Cadastrando livro..."

    cadastrarLivro (Livro 0 "Dom Casmurro" "Machado de Assis" "Romance" 1899)

    putStrLn "\nLivros cadastrados:"

    livros <- listarLivros

    mapM_ print livros