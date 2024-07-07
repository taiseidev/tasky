# ベースイメージとして最新のGoの公式イメージを使用
FROM golang:1.21-alpine

# 必要なパッケージのインストール
RUN apk add --no-cache git

# 作業ディレクトリの設定
WORKDIR /app

# Go Modulesを有効化
ENV GO111MODULE=on

# ホストのファイルをコンテナの作業ディレクトリにコピー
COPY . .

# 依存関係のダウンロードと検証
RUN go mod download

# アプリケーションのビルド
RUN go build -o main ./api

# コンテナ起動時に実行されるコマンド
CMD ["./main"]
