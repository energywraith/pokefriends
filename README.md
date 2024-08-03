# [![PokeFriends logo](./public/brand.png)](https://pokefriends-upur.onrender.com/)

A Ruby on Rails application that simplifies the adoption process for Pokémon. Browse available Pokémon, submit adoption applications, and view detailed Pokedex profiles.

This application is deployed and can be accessed [here](https://pokefriends-upur.onrender.com/). *(Load may take a while, since it is deployed using Render on a Hobby Plan)*.

## Designs

All designs for this application were created using Figma. You can view the designs [here](https://www.figma.com/community/file/1401537151842335650/pokefriends?fuid=1035540441731437240).

## Ruby Version

```plaintext
ruby '3.2.2
```

## System Dependencies

```plaintext
- Rails 7.1.3
- PostgreSQL
```

## Configuration

### Database Initialization

```sh
rails db:create
rails db:migrate
rails db:seed
```

## Deployment Instructions

### 1. Ensure all dependencies are installed.

### 2. Precompile assets

```sh
rails assets:precompile
```

### 3. Migrate the database

```sh
rails db:migrate RAILS_ENV=production
```

### 4. Start the application server

```sh
rails server -e production
```

Application includes ```render.yaml```, and ```bin\render-build.sh```, which makes it easy to deploy application to [Render](https://render.com/) using Blueprint.

## Acknowledgments

The application uses [PokeAPI](https://pokeapi.co/) to obtain Pokémon sprites. All other information is sourced from CSV files located in the ```lib/seeds/table_name.csv``` directory.

I am thankful for the [PokeAPI](https://pokeapi.co/), which provides an excellent resource for Pokémon data.

## Future Development

- **User Accounts**: Implement user accounts to allow users involved in the adoption process to view and manage their applications in a user-friendly interface.
- **Shelter Administrator Dashboard**: Create a dashboard for shelter administrators to add new Pokémon for adoption, edit existing entries, and manage ongoing adoption processes.
- **Mobile App Development**: Develop a mobile app enabling users to manage their adoption processes. Consider adding a game-like feature where users can interact with their Pokémon by feeding, washing, and playing with them, similar to Tamagotchi.
- **Inclusion of Newer Pokémon Generations**: Add newer Pokémon generations to the app to allow enthusiasts to adopt their favorite Pokémon from more recent releases.

---

Pokémon and all related content are the property of The Pokémon Company. This application is not affiliated with, endorsed, or sponsored by The Pokémon Company.