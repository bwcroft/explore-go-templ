package server

import (
	"net/http"

	"github.com/bwcroft/explore-go-temple/handlers"
)

func InitServer() {
	http.Handle("/", handlers.HomePage())
	http.ListenAndServe(":8080", nil)
}
