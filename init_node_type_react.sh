PRJ_NM=$1
echo $PRJ_NM

mkdir $PRJ_NM
cd $PRJ_NM
mkdir server
cd server

npm init -y
npm install typescript --save-dev
npm install @types/node --save-dev

npx tsc --init --rootDir src --outDir build --esModuleInterop --resolveJsonModule --lib es6 --module commonjs --allowJs true --noImplicitAny true
mkdir src
touch src/index.ts

npm install --save-dev ts-node nodemon

echo "$(jq '.scripts={"watch":"tsc -w","dev":"nodemon build/index.js"}' package.json)" > package.json

echo "[server] Done!"

cd ..
npx create-react-app client --template typescript
echo "[client] Done!"
echo "Thank you for using this tool! By Gal.S"

