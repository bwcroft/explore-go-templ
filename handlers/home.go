package handlers

import (
	"net/http"

	"github.com/a-h/templ"
	"github.com/bwcroft/explore-go-temple/views"
)

func HomePage() http.Handler {
  comp := views.Home("Bob")
  return templ.Handler(comp)
}
