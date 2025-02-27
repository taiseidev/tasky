module github.com/taiseidev/tasky/tasky_server

go 1.19

require github.com/labstack/echo/v4 v4.12.0

require github.com/stretchr/testify v1.9.0 // indirect

require (
	filippo.io/edwards25519 v1.1.0 // indirect
	github.com/go-sql-driver/mysql v1.8.1
	github.com/labstack/gommon v0.4.2 // indirect
	github.com/mattn/go-colorable v0.1.13 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	github.com/valyala/bytebufferpool v1.0.0 // indirect
	github.com/valyala/fasttemplate v1.2.2 // indirect
	golang.org/x/crypto v0.25.0 // indirect
	golang.org/x/net v0.27.0 // indirect
	golang.org/x/sys v0.22.0 // indirect
	golang.org/x/text v0.16.0 // indirect
)

replace github.com/taiseidev/tasky/tasky_server/middleware => ./middleware

replace github.com/taiseidev/tasky/tasky_server/models => ./models

replace github.com/taiseidev/tasky/tasky_server/repositories => ./repositories

replace github.com/taiseidev/tasky/tasky_server/config => ./config

replace github.com/taiseidev/tasky/tasky_server/controllers => ./controllers

replace github.com/taiseidev/tasky/tasky_server/services => ./services
