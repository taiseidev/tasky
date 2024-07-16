package controllers

import (
	"database/sql"
	"log"
	"net/http"
	"strconv"

	"github.com/go-sql-driver/mysql"
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
		log.Println(err)
		return ctx.JSON(http.StatusBadRequest, err)
	}

	log.Println("User data:", user)

	if err := c.Service.CreateUser(user); err != nil {
		log.Println("Error creating user:", err)
		if mysqlErr, ok := err.(*mysql.MySQLError); ok {
			switch mysqlErr.Number {
			case 1062:
				return ctx.JSON(http.StatusConflict, models.ErrorResponse{
					Title:   "重複エラー",
					Message: "メールアドレスが重複しています。",
				})
			default:
				return ctx.JSON(http.StatusBadRequest, models.ErrorResponse{
					Title:   "エラー",
					Message: "何かしらのエラーが発生しました。",
				})
			}
		}
		return ctx.JSON(http.StatusBadRequest, models.ErrorResponse{
			Title:   "エラー",
			Message: "何かしらのエラーが発生しました。",
		})
	}

	return ctx.JSON(http.StatusCreated, user)
}

func (c *UserController) GetUser(ctx echo.Context) error {
	id, err := strconv.Atoi(ctx.Param("id"))

	if err != nil {
		log.Println(err)
		return ctx.JSON(http.StatusBadRequest, models.ErrorResponse{
			Title:   "Invalid ID",
			Message: "The provided user ID is invalid",
		})
	}

	user, err := c.Service.GetUser(id)

	if err != nil {
		log.Println(err)
		if err == sql.ErrNoRows {
			return ctx.JSON(http.StatusNotFound, models.ErrorResponse{
				Title:   "エラー",
				Message: "ユーザが見つかりませんでした。",
			})
		}
		return ctx.JSON(http.StatusInternalServerError, models.ErrorResponse{
			Title:   "エラー",
			Message: "何かしらのエラーが発生しました。",
		})
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
		if mysqlErr, ok := err.(*mysql.MySQLError); ok {
			switch mysqlErr.Number {
			case 1062:
				return ctx.JSON(http.StatusConflict, models.ErrorResponse{
					Title:   "重複エラー",
					Message: "メールアドレスが重複しています。",
				})
			default:
				return ctx.JSON(http.StatusBadRequest, models.ErrorResponse{
					Title:   "エラー",
					Message: "何かしらのエラーが発生しました。",
				})
			}
		}
		return ctx.JSON(http.StatusBadRequest, models.ErrorResponse{
			Title:   "エラー",
			Message: "何かしらのエラーが発生しました。",
		})
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
		log.Println(err)
		if err == sql.ErrNoRows {
			return ctx.JSON(http.StatusNotFound, models.ErrorResponse{
				Title:   "エラー",
				Message: "ユーザが見つかりませんでした。",
			})
		}
		return ctx.JSON(http.StatusInternalServerError, models.ErrorResponse{
			Title:   "エラー",
			Message: "何かしらのエラーが発生しました。",
		})
	}

	return ctx.NoContent(http.StatusNoContent)
}
