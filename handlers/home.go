package handlers

import (
	"net/http"

	"github.com/a-h/templ"
	"github.com/bwcroft/explore-go-temple/components"
)

func HomePage() http.Handler {
	comp := components.Home()
	return templ.Handler(comp)
}
