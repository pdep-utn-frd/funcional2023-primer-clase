{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_primerClase (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/juan/facultad/pdp2023/primerClase/.stack-work/install/x86_64-linux-tinfo6/0c739a1a3e0363c61890fedf1543cafe0bdd2fcebaeb870a7ee440e9866bcc44/9.2.7/bin"
libdir     = "/home/juan/facultad/pdp2023/primerClase/.stack-work/install/x86_64-linux-tinfo6/0c739a1a3e0363c61890fedf1543cafe0bdd2fcebaeb870a7ee440e9866bcc44/9.2.7/lib/x86_64-linux-ghc-9.2.7/primerClase-0.1.0.0-CnRkkz1n0leFYc6uZZvffL-primerClase"
dynlibdir  = "/home/juan/facultad/pdp2023/primerClase/.stack-work/install/x86_64-linux-tinfo6/0c739a1a3e0363c61890fedf1543cafe0bdd2fcebaeb870a7ee440e9866bcc44/9.2.7/lib/x86_64-linux-ghc-9.2.7"
datadir    = "/home/juan/facultad/pdp2023/primerClase/.stack-work/install/x86_64-linux-tinfo6/0c739a1a3e0363c61890fedf1543cafe0bdd2fcebaeb870a7ee440e9866bcc44/9.2.7/share/x86_64-linux-ghc-9.2.7/primerClase-0.1.0.0"
libexecdir = "/home/juan/facultad/pdp2023/primerClase/.stack-work/install/x86_64-linux-tinfo6/0c739a1a3e0363c61890fedf1543cafe0bdd2fcebaeb870a7ee440e9866bcc44/9.2.7/libexec/x86_64-linux-ghc-9.2.7/primerClase-0.1.0.0"
sysconfdir = "/home/juan/facultad/pdp2023/primerClase/.stack-work/install/x86_64-linux-tinfo6/0c739a1a3e0363c61890fedf1543cafe0bdd2fcebaeb870a7ee440e9866bcc44/9.2.7/etc"

getBinDir     = catchIO (getEnv "primerClase_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "primerClase_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "primerClase_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "primerClase_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "primerClase_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "primerClase_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
