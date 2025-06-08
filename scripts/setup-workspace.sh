arch=$(uname -p)
os=$(uname -s)

if [[ $arch == x86_64* ]]; then
    echo "X64 Architecture"
elif [[ $arch == i*86 ]]; then
    echo "X32 Architecture"
elif  [[ $arch == arm* ]]; then
  if [[ $os == Darwin* || $os == darwin* ]]; then
    brew install icarus-verilog
    echo "Downloading and installing OSS CAD Suite..."
    # Загрузка и распаковка в одну команду для macOS arm64
    mkdir -p ~/oss-cad-suite
    curl -L https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2023-09-15/oss-cad-suite-darwin-arm64-20230915.tgz | tar -xz -C ~/oss-cad-suite --strip-components=1
    echo "OSS CAD Suite installed in ~/oss-cad-suite"
    echo "Add the following line to your ~/.zshrc or ~/.bash_profile:"
    echo 'export PATH="$PATH:$HOME/oss-cad-suite/bin"'
  fi
else 
  echo "Platform \"$arch\" is not supported yet"
fi