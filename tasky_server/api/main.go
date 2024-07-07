package main

import (
	"github.com/labstack/echo/v4"
	"github.com/taiseidev/tasky/tasky_server/config"
	"github.com/taiseidev/tasky/tasky_server/controllers"
)

func main() {
	// Initialize Echo
	e := echo.New()

	// Initialize database
	db := config.InitDB()

	// Initialize user controller
	userController := controllers.NewUserController(db)

	// Define routes
	e.POST("/users", userController.CreateUser)
	e.GET("/users/:id", userController.GetUser)
	e.PUT("/users/:id", userController.UpdateUser)
	e.DELETE("/users/:id", userController.DeleteUser)

	// Start server
	e.Start(":8080")
}
