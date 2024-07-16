package models

type ErrorResponse struct {
	Title   string `json:"title"`
	Message string `json:"message,omitempty"`
}
