import requests


def get_all_pages_from_category(category):
    category_root = requests.get("https://swapi.dev/api/" + category)
    pages = []
    pages.append(category_root)

    for page in pages:
        if page.json()['next'] is not None:
            pages.append(requests.get(page.json()['next']))

    return pages


def convert_pages_to_combined_entity_list(pages):
    entities = []
    for page in pages:
        entities.extend(page.json()['results'])

    return entities


def get_all_possible_values_of_attribute_from_entity_list(attribute, entity_list):
    possible_attribute_values = set()
    for entity in entity_list:
        for current_attribute in entity[attribute].split(', '):
            possible_attribute_values.add(current_attribute)

    return possible_attribute_values

# Useful for determining types (and sizes) for MySQL DDL code
def get_longest_attribute_of_attribute_set(attribute_set):
    longest_attribute = 0
    for attribute in attribute_set:
        if len(attribute) > longest_attribute:
            longest_attribute = len(attribute)

    return longest_attribute


planets_pages = get_all_pages_from_category("planets")
planets = convert_pages_to_combined_entity_list(planets_pages)
possible_terrain_values =\
    get_all_possible_values_of_attribute_from_entity_list('terrain', planets)
possible_climate_values =\
    get_all_possible_values_of_attribute_from_entity_list('climate', planets)

species_pages = get_all_pages_from_category("species")
species = convert_pages_to_combined_entity_list(species_pages)
possible_species_skin_colors_values =\
    get_all_possible_values_of_attribute_from_entity_list('skin_colors', species)
possible_species_hair_colors_values =\
    get_all_possible_values_of_attribute_from_entity_list('hair_colors', species)
possible_species_eye_colors_values =\
    get_all_possible_values_of_attribute_from_entity_list('eye_colors', species)

people_pages = get_all_pages_from_category("people")
people = convert_pages_to_combined_entity_list(people_pages)
possible_people_skin_color_values =\
    get_all_possible_values_of_attribute_from_entity_list('skin_color', people)
possible_people_hair_color_values =\
    get_all_possible_values_of_attribute_from_entity_list('hair_color', people)
possible_people_eye_color_values =\
    get_all_possible_values_of_attribute_from_entity_list('eye_color', people)

possible_combined_skin_color_values =\
    possible_species_skin_colors_values.union(possible_people_skin_color_values)
possible_combined_hair_colors_values =\
    possible_species_hair_colors_values.union(possible_people_hair_color_values)
possible_combined_eye_colors_values =\
    possible_species_eye_colors_values.union(possible_people_eye_color_values)

starships_pages = get_all_pages_from_category("starships")
starships = convert_pages_to_combined_entity_list(starships_pages)
possible_starship_name_values =\
    get_all_possible_values_of_attribute_from_entity_list('name', starships)
possible_starship_model_values =\
    get_all_possible_values_of_attribute_from_entity_list('model', starships)
possible_starship_manufacturer_values =\
    get_all_possible_values_of_attribute_from_entity_list('manufacturer', starships)
possible_starship_starship_class_values =\
    get_all_possible_values_of_attribute_from_entity_list('starship_class', starships)
possible_starship_hyperdrive_rating_values =\
    get_all_possible_values_of_attribute_from_entity_list('hyperdrive_rating', starships)
