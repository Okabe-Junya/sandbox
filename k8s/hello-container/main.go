package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("Received request from %s for %s\n", r.RemoteAddr, r.URL.Path)
	fmt.Fprintf(w, "Hello, World!\n")
}

func main() {
	http.HandleFunc("/", handler)
	http.ListenAndServe(":9999", nil)
}
