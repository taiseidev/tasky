package controllers

import (
	"database/sql"
	"log"
	"net/http"
	"strconv"

	"github.com/labstack/echo/v4"
	"github.com/taiseidev/tasky/tasky_server/models"
	"github.com/taiseidev/tasky/tasky_server/repositories"
	"github.com/taiseidev/tasky/tasky_server/services"
)

type UserController struct {
	Service *services.UserService
}

func NewUserController(db *sql.DB) *UserController {
	repo := repositories.NewUserRepository(db)
	service := services.NewUserService(repo)
	return &UserController{Service: service}
}

func (c *UserController) CreateUser(ctx echo.Context) error {
	user := new(models.User)
	if err := ctx.Bind(user); err != nil {
		log.Println("Error binding user:", err)
		return ctx.JSON(http.StatusBadRequest, err)
	}
	log.Println("User data:", user)
	if err := c.Service.CreateUser(user); err != nil {
		log.Println("Error creating user:", err)
		return ctx.JSON(http.StatusInternalServerError, err)
	}
	return ctx.JSON(http.StatusCreated, user)
}

func (c *UserController) GetUser(ctx echo.Context) error {
	id, err := strconv.Atoi(ctx.Param("id"))
	if err != nil {
		log.Println("Error converting id:", err)
		return ctx.JSON(http.StatusBadRequest, err)
	}
	user, err := c.Service.GetUser(id)
	if err != nil {
		log.Println("Error getting user:", err)
		return ctx.JSON(http.StatusNotFound, err)
	}
	return ctx.JSON(http.StatusOK, user)
}

func (c *UserController) UpdateUser(ctx echo.Context) error {
	id, err := strconv.Atoi(ctx.Param("id"))
	if err != nil {
		log.Println("Error converting id:", err)
		return ctx.JSON(http.StatusBadRequest, err)
	}
	user := new(models.User)
	if err := ctx.Bind(user); err != nil {
		log.Println("Error binding user:", err)
		return ctx.JSON(http.StatusBadRequest, err)
	}
	user.ID = id
	if err := c.Service.UpdateUser(user); err != nil {
		log.Println("Error updating user:", err)
		return ctx.JSON(http.StatusInternalServerError, err)
	}
	return ctx.JSON(http.StatusOK, user)
}

func (c *UserController) DeleteUser(ctx echo.Context) error {
	id, err := strconv.Atoi(ctx.Param("id"))
	if err != nil {
		log.Println("Error converting id:", err)
		return ctx.JSON(http.StatusBadRequest, err)
	}
	if err := c.Service.DeleteUser(id); err != nil {
		log.Println("Error deleting user:", err)
		return ctx.JSON(http.StatusInternalServerError, err)
	}
	return ctx.NoContent(http.StatusNoContent)
}
