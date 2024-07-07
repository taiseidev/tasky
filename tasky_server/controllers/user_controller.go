package services

import (
	"github.com/taiseidev/tasky/tasky_server/models"
	"github.com/taiseidev/tasky/tasky_server/repositories"
)

type UserService struct {
	Repo *repositories.UserRepository
}

func NewUserService(repo *repositories.UserRepository) *UserService {
	return &UserService{Repo: repo}
}

func (s *UserService) CreateUser(user *models.User) error {
	return s.Repo.Create(user)
}

func (s *UserService) GetUser(id int) (*models.User, error) {
	return s.Repo.GetByID(id)
}

func (s *UserService) UpdateUser(user *models.User) error {
	return s.Repo.Update(user)
}

func (s *UserService) DeleteUser(id int) error {
	return s.Repo.Delete(id)
}
