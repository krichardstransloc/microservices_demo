package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func hello(c *gin.Context) {
	c.String(http.StatusOK, "Hello, Gin!")
}

func main() {
	router := gin.Default()
	router.GET("/", hello)
	router.Run()
}
