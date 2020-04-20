module Tools where

conditionalRemove :: [a] -> (a -> Bool) -> [a]
conditionalRemove [] _ = []
conditionalRemove (x:xs) f = if f x
                            then conditionalRemove xs f
                            else x : conditionalRemove xs f

-- the second string is the previous characters in the same section
-- cant be made generic because empty strings need to be made
_splitString :: String -> Char -> String -> [String]
_splitString [] seperator s = [s]
_splitString (x:xs) seperator s = if x == seperator
                                    then (s : _splitString xs seperator "")
                                    else _splitString xs seperator (s++[x])
splitString :: String -> Char -> [String]
splitString s c = _splitString s c ""

isQuestionmark :: Char -> Bool
isQuestionmark c = c == '?'