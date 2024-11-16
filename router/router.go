package router 

import (
	"net/http"

	"github.com/bwcroft/explore-go-temple/handlers"
)

func InitRouter() {
	http.Handle("/", handlers.HomePage())
	http.ListenAndServe(":8080", nil)
}
