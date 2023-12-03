package classes

import "github.com/jaswdr/faker"

var fake faker.Faker = faker.New()

func GetFaker() faker.Faker {
	return fake
}
