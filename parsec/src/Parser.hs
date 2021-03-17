module Parser where

import Megaparsec.Parser
import AstStmt

data ParserType = Mega deriving (Show)

parse :: ParserType -> String -> Either String Program
parse Mega = Megaparsec.Parser.parse

