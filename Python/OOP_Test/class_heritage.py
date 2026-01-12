class Animal:
    def __init__(self, species, subspecies, name, category, reproduction):
        self.species = species
        self.subspecies = subspecies
        self.name = name
        self.category = category
        self.reproduction = reproduction
        self.is_alive = False

    def __str__(self):
        return f"{self.species}, {self.subspecies}, {self.name}, {self.category}, {self.reproduction}"

    def born(self):
        self.is_alive = True

class Dog(Animal):
    def __init__(self, species, subspecies, name, category, reproduction, breed, size):
        super().__init__(species, subspecies, name, category, reproduction)
        self.breed = breed
        self.size = size