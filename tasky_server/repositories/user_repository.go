package repositories

import (
	"database/sql"

	"github.com/taiseidev/tasky/tasky_server/models"
)

type UserRepository struct {
	DB *sql.DB
}

func NewUserRepository(db *sql.DB) *UserRepository {
	return &UserRepository{DB: db}
}

func (r *UserRepository) Create(user *models.User) error {
	query := "INSERT INTO users (name, email, password) VALUES (?, ?, ?)"
	_, err := r.DB.Exec(query, user.Name, user.Email, user.Password)
	return err
}

func (r *UserRepository) GetByID(id int) (*models.User, error) {
	row := r.DB.QueryRow("SELECT id, name, email FROM users WHERE id = ?", id)
	var user models.User
	err := row.Scan(&user.ID, &user.Name, &user.Email)
	if err != nil {
		return nil, err
	}
	return &user, nil
}

func (r *UserRepository) Update(user *models.User) error {
	query := "UPDATE users SET name = ?, email = ? WHERE id = ?"
	_, err := r.DB.Exec(query, user.Name, user.Email, user.ID)
	return err
}

func (r *UserRepository) Delete(id int) error {
	query := "DELETE FROM users WHERE id = ?"
	_, err := r.DB.Exec(query, id)
	return err
}
