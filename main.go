package main

import (
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(resp http.ResponseWriter, req *http.Request) {
		resp.Write([]byte("hello world"))
	})
	log.Fatalln(http.ListenAndServe(":3000", nil))
}
